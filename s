import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {

  // Go to https://www.demoblaze.com/
  await page.goto('https://www.demoblaze.com/');

  // Click text=Monitors
  await page.click('text=Monitors');
  await expect(page).toHaveURL('https://www.demoblaze.com/#');

  // Click button:has-text("Next")
  await page.click('button:has-text("Next")');

  // Click text=2017 Dell 15.6 Inch
  await page.click('text=2017 Dell 15.6 Inch');
  await expect(page).toHaveURL('https://www.demoblaze.com/prod.html?idp_=13');

  // Click text=Add to cart
  page.once('dialog', dialog => {
    console.log(`Dialog message: ${dialog.message()}`);
    dialog.dismiss().catch(() => {});
  });
  await page.click('text=Add to cart');
  await expect(page).toHaveURL('https://www.demoblaze.com/prod.html?idp_=13#');

  // Click text=Cart
  await page.click('text=Cart');
  await expect(page).toHaveURL('https://www.demoblaze.com/cart.html');

  // Click button:has-text("Place Order")
  await page.click('button:has-text("Place Order")');

  // Click text=Place order × >> [aria-label="Close"]
  await page.click('text=Place order × >> [aria-label="Close"]');

  // Click text=Delete
  await Promise.all([
    page.waitForNavigation(/*{ url: 'https://www.demoblaze.com/cart.html#' }*/),
    page.click('text=Delete')
  ]);

  // Click a:has-text("Contact")
  await page.click('a:has-text("Contact")');

  // Click input[type="text"]
  await page.click('input[type="text"]');

  // Fill input[type="text"]
  await page.fill('input[type="text"]', 'jhkjgjh@gmail.com');

  // Triple click #recipient-name
  await page.click('#recipient-name', {
    clickCount: 3
  });

  // Fill #recipient-name
  await page.fill('#recipient-name', 'Anna');

  // Click textarea
  await page.click('textarea');

  // Fill textarea
  await page.fill('textarea', 'Hello');

  // Click text=Send message
  page.once('dialog', dialog => {
    console.log(`Dialog message: ${dialog.message()}`);
    dialog.dismiss().catch(() => {});
  });
  await page.click('text=Send message');
  await expect(page).toHaveURL('https://www.demoblaze.com/cart.html#');

});
