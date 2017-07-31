@administrator_order_comments
Feature: Commenting an order by an administrator
    In order to communicate with the customer that made an order
    As an Administrator
    I want to be able to add a comment to the order

    Background:
        Given the store operates on a single channel in "United States"
        And the store has a product "PHP T-Shirt"
        And the store ships everywhere for free
        And the store allows paying with "Cash on Delivery"
        And there was account of "john.doe@gmail.com" with password "sylius"
        And there is a customer "john.doe@gmail.com" that placed an order "#00000022"
        And the customer bought a single "PHP T-Shirt"
        And the customer chose "Free" shipping method to "United States" with "Cash on Delivery" payment
        And I am logged in as an administrator

    @domain
    Scenario: Administrator commented an order
        When I comment the order "#00000022" with "How can I help you?"
        Then this order should have a comment with "How can I help you?" from this administrator

    @domain
    Scenario: Administrator cannot comment the order with an empty message
        When I try to comment the order "#00000022" with an empty message
        Then I should be notified that comment is invalid
        And this order should not have any comments

    @todo
    Scenario: Sending an email notification to the customer about unread comments
        Given I have commented the order "#00000022" with "How can I help you?"
        Then the notification email should be sent to the customer
