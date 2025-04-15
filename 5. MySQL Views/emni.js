const puppeteer = require('puppeteer');

(async () => {
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto('SQL Roadmap.html'); // Update path
  await page.setViewport({ width: 1280, height: 800 });
  await page.screenshot({ path: 'roadmap.png', fullPage: true }); // For PNG
  await browser.close();
})();