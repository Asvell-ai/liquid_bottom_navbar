const fs = require('fs');
const path = require('path');
const { PNG } = require('pngjs');
const { chromium } = require('playwright');
const { GIFEncoder, quantize, applyPalette } = require('gifenc');

const root = path.resolve(__dirname, '..');
const assetsDir = path.join(root, 'assets');
const url = process.env.PREVIEW_URL || 'http://127.0.0.1:51515';

async function main() {
  fs.mkdirSync(assetsDir, { recursive: true });

  const browser = await chromium.launch({ channel: 'chrome', headless: true });
  const page = await browser.newPage({
    viewport: { width: 375, height: 812 },
    deviceScaleFactor: 1,
  });

  await page.goto(url, { waitUntil: 'networkidle' });
  await page.waitForTimeout(1800);
  await page.screenshot({ path: path.join(assetsDir, 'preview.png') });

  const frames = [];
  const y = 752;
  const pathXs = [69, 148, 226, 305, 226, 148, 69];

  async function captureFrame(delay = 95) {
    await page.waitForTimeout(delay);
    frames.push(await page.screenshot({ type: 'png' }));
  }

  await page.mouse.move(pathXs[0], y);
  await page.mouse.down();
  await captureFrame(120);

  for (let point = 1; point < pathXs.length; point += 1) {
    const from = pathXs[point - 1];
    const to = pathXs[point];

    for (let step = 1; step <= 5; step += 1) {
      const x = from + ((to - from) * step) / 5;
      await page.mouse.move(x, y, { steps: 2 });
      await captureFrame(80);
    }
  }

  await page.mouse.up();
  for (let i = 0; i < 8; i += 1) {
    await captureFrame(120);
  }

  await browser.close();

  const first = PNG.sync.read(frames[0]);
  const gif = GIFEncoder();

  for (const frame of frames) {
    const png = PNG.sync.read(frame);
    const palette = quantize(png.data, 256);
    const indexed = applyPalette(png.data, palette);
    gif.writeFrame(indexed, first.width, first.height, {
      palette,
      delay: 130,
      transparent: false,
    });
  }

  gif.finish();
  fs.writeFileSync(path.join(assetsDir, 'demo.gif'), Buffer.from(gif.bytes()));
}

main().catch((error) => {
  console.error(error);
  process.exit(1);
});
