import { Given, When, Then } from "@badeball/cypress-cucumber-preprocessor";

Given(
  "I am logged in as {string} using password {string}",
  (user: string, password: string) => {
    cy.visit("/");
    cy.get(`*[data-testid=user-login]`).focus().type(user);
    cy.get(`*[data-testid=user-password]`)
      .focus()
      .type(password)
      .type("{enter}");
    cy.get(`*[data-testid=user-menu-greeting]`).should(
      "have.text",
      `Signed in as ${user}.`
    );
  }
);

Then("I see {string} element", (elementID) => {
  cy.get(`*[data-testid=${elementID}]`)
    .first()
    .as("currentElement")
    .should("be.visible");
});

Then(
  "I see {string} element that contains text {string}",
  (elementSelector: string, text: string) => {
    cy.get(elementSelector)
      .contains(text)
      .first()
      .as("currentElement")
      .should("be.visible");
  }
);

When("I click on it", () => {
  cy.get("@currentElement").click();
});

When("I focus on it and type {string}", (value: string) => {
  cy.get("@currentElement").focus();
  cy.get("@currentElement").type(value);
});
When("I press 'Enter' on keyboard", () => {
  cy.get("@currentElement").type("{enter}");
});
