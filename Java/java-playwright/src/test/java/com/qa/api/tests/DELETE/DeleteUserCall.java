package com.qa.api.tests.DELETE;

import com.api.data.Users;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.microsoft.playwright.APIRequest;
import com.microsoft.playwright.APIRequestContext;
import com.microsoft.playwright.APIResponse;
import com.microsoft.playwright.Playwright;
import com.microsoft.playwright.options.RequestOptions;
import org.testng.Assert;
import org.testng.annotations.AfterTest;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

public class DeleteUserCall {
    Playwright playwright;
    APIRequest apiRequest;
    APIRequestContext requestContext;

    public static String getRandomEmail(){
        String emailId = "rraccoon"+System.currentTimeMillis() +"@gmail.com";
        return emailId;
    }

    @BeforeTest
    public void setup(){
        playwright = Playwright.create();
        apiRequest = playwright.request();
        requestContext = apiRequest.newContext();
    }

    @AfterTest
    public void tearDown(){
        playwright.close();
    }

    @Test
    public void deleteUserTest() throws JsonProcessingException {

        //Create users object: using builder pattern
        Users userData = Users.builder()
                .name("Rocket Raccoon")
                .email(getRandomEmail())
                .gender("male")
                .status("active").build();

        //POST Call: create a user
        APIResponse apiResponse = requestContext.post("https://gorest.co.in/public/v2/users",
                RequestOptions.create()
                        .setHeader("context-type", "application/json")
                        .setHeader("Authorization", "Bearer 9a32c88468523f9c150a5665a0595bdc782d425a250ef6f6d758ed62d5934024")
                        .setData(userData));

        ObjectMapper objectMapper = new ObjectMapper();
        Users createUserResp = objectMapper.readValue(apiResponse.text(), Users.class);
        int userId = createUserResp.getId();

        //PUT Call: delete user
        APIResponse apiDeleteResponse = requestContext.delete("https://gorest.co.in/public/v2/users/" + userId,
                RequestOptions.create()
                        .setHeader("Authorization", "Bearer 9a32c88468523f9c150a5665a0595bdc782d425a250ef6f6d758ed62d5934024"));

        //GET Call: fetch user
        APIResponse apiFetchResponse = requestContext.get("https://gorest.co.in/public/v2/users/" + userId,
                RequestOptions.create()
                        .setHeader("Authorization", "Bearer 9a32c88468523f9c150a5665a0595bdc782d425a250ef6f6d758ed62d5934024"));

        //ASSERT
        Assert.assertEquals(apiFetchResponse.status(), 404);

        System.out.println("--- Updated User Fetch Response ---");
        System.out.println(apiFetchResponse.text());
    }
}
