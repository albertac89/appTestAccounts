var express = require("express");
var app = express();
app.listen(3000, () => {
 console.log("Server running on port 3000");
});
app.get("/accounts", (req, res, next) => {
    setTimeout(function() {
        res.json([
            {
               "account_id":"1",
               "company_name":"Business Example LTD",
               "amount":{
                  "amount":"198395.3700",
                  "currency":"USD",
                  "currency_name":"US Dollar"
               },
               "credit_debit_indicator":"Credit",
               "datetime":"2022-08-08T15:44:45.294"
            },
            {
               "account_id":"2",
               "company_name":"Business Example LTD",
               "amount":{
                  "amount":"2607.1200",
                  "currency":"EUR",
                  "currency_name":"Euro"
               },
               "credit_debit_indicator":"Credit",
               "datetime":"2022-08-08T15:44:45.294"
            },
            {
               "account_id":"3",
               "company_name":"Business Example LTD",
               "amount":{
                  "amount":"43308.5600",
                  "currency":"GBP",
                  "currency_name":"British Pound"
               },
               "credit_debit_indicator":"Credit",
               "datetime":"2022-08-08T15:44:45.294"
            },
            {
               "account_id":"4",
               "company_name":"Business Example LTD",
               "amount":{
                  "amount":"98541.1900",
                  "currency":"GBP",
                  "currency_name":"British Pound"
               },
               "credit_debit_indicator":"Credit",
               "datetime":"2022-08-08T15:44:45.294"
            },
            {
               "account_id":"5",
               "company_name":"Business Example LTD",
               "amount":{
                  "amount":"29608.4200",
                  "currency":"EUR",
                  "currency_name":"Euro"
               },
               "credit_debit_indicator":"Credit",
               "datetime":"2022-08-08T15:44:45.294"
            },
            {
               "account_id":"6",
               "company_name":"Business Example LTD",
               "amount":{
                  "amount":"10.9200",
                  "currency":"USD",
                  "currency_name":"US Dollar"
               },
               "credit_debit_indicator":"Credit",
               "datetime":"2022-08-08T15:44:45.294"
            },
            {
               "account_id":"7",
               "company_name":"Business Example LTD",
               "amount":{
                  "amount":"898654.1200",
                  "currency":"EUR",
                  "currency_name":"Euro"
               },
               "credit_debit_indicator":"Credit",
               "datetime":"2022-08-08T15:44:45.294"
            },
            {
               "account_id":"8",
               "company_name":"Business Example LTD",
               "amount":{
                  "amount":"7760.200",
                  "currency":"EUR",
                  "currency_name":"Euro"
               },
               "credit_debit_indicator":"Credit",
               "datetime":"2022-08-08T15:44:45.294"
            }
         ]);
    },3000);
});