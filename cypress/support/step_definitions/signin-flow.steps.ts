import { When, Then } from "@badeball/cypress-cucumber-preprocessor";

When("I visit {string} page", (path) => {
  cy.visit(`${path}`);
});
Then("I do not see {string} element", (elementID) => {
  cy.get(`*[data-testid=${elementID}]`).should("not.exist");
});
Then("I am navigated to {} page", (path: string) => {
  const normalizedPath = path.replace(/'/g, "");
  const regex = normalizedPath.replace("{notebook-id}", "[A-z0-9]{1,32}");
  cy.url().should("match", new RegExp(regex));
});

Then("it has inner text of {string}", (value) => {
  cy.get("@currentElement").should("have.text", value);
});
