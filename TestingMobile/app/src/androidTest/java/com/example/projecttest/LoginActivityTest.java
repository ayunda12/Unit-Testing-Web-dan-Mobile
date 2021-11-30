package com.example.projecttest;

import static androidx.test.espresso.Espresso.onView;
import static androidx.test.espresso.action.ViewActions.clearText;
import static androidx.test.espresso.action.ViewActions.click;
import static androidx.test.espresso.action.ViewActions.closeSoftKeyboard;
import static androidx.test.espresso.action.ViewActions.typeText;
import static androidx.test.espresso.assertion.ViewAssertions.matches;
import static androidx.test.espresso.matcher.RootMatchers.withDecorView;
import static androidx.test.espresso.matcher.ViewMatchers.isDisplayed;
import static androidx.test.espresso.matcher.ViewMatchers.withId;
import static androidx.test.espresso.matcher.ViewMatchers.withText;

import static org.hamcrest.core.IsNot.not;

import android.app.Fragment;
import android.view.View;
import android.widget.EditText;

import androidx.annotation.StringRes;
import androidx.test.ext.junit.runners.AndroidJUnit4;
import androidx.test.rule.ActivityTestRule;

import org.hamcrest.CoreMatchers;
import org.hamcrest.Description;
import org.hamcrest.Matcher;
import org.hamcrest.TypeSafeMatcher;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

//Kelas pengujian LoginActivityTest dan anotasi runner.
@RunWith(AndroidJUnit4.class)
public class LoginActivityTest {

    //Aturan pengujian aktivitas
    @Rule
    public ActivityTestRule<LoginActivity> activityTestRule = new ActivityTestRule<>(LoginActivity.class);

    //Ketika email kosong dan akan menampilkan peringatan bahwa "This field is required"
    @Test
    public void emailIsEmpty() {
        onView(withId(R.id.tv_email)).perform(clearText());
        onView(withId(R.id.btn_login)).perform(click());
        onView(withId(R.id.tv_email)).check(matches(withError(getString(R.string.error_field_required))));
    }

    //Ketika password kosong dan akan menampilkan peringatan bahwa "This field is required"
    @Test
    public void passwordIsEmpty() {
        onView(withId(R.id.tv_email)).perform(typeText("email@email.com"), closeSoftKeyboard());
        onView(withId(R.id.tv_password)).perform(clearText());
        onView(withId(R.id.btn_login)).perform(click());
        onView(withId(R.id.tv_password)).check(matches(withError(getString(R.string.error_field_required))));
    }

    //Ketika email tidak valid, maka akan menampilkan pesan kesalahan.
    @Test
    public void emailIsInvalid() {
        onView(withId(R.id.tv_email)).perform(typeText("invalid"), closeSoftKeyboard());
        onView(withId(R.id.btn_login)).perform(click());
        onView(withId(R.id.tv_email)).check(matches(withError(getString(R.string.error_invalid_email))));
    }

    //Ketika kata sandi terlalu pendek, maka akan menampilkan pesan kesalahan.
    @Test
    public void passwordIsTooShort() {
        onView(withId(R.id.tv_email)).perform(typeText("email@email.com"), closeSoftKeyboard());
        onView(withId(R.id.tv_password)).perform(typeText("1234"), closeSoftKeyboard());
        onView(withId(R.id.btn_login)).perform(click());
        onView(withId(R.id.tv_password)).check(matches(withError(getString(R.string.error_invalid_password))));
    }


    //Untuk memeriksa pesan selamat datang ditampilkan dengan benar.
    @Test
    public void loginSuccessfully_shouldShowWelcomeMessage() {
        onView(withId(R.id.tv_email)).perform(typeText("user@email.com"), closeSoftKeyboard());
        onView(withId(R.id.tv_password)).perform(typeText("123456"), closeSoftKeyboard());
        onView(withId(R.id.btn_login)).perform(click());
        onView(withId(R.id.tv_welcome)).check(matches(withText("Hi user@email.com!")));
    }


    private String getString(@StringRes int resourceId) {
        return activityTestRule.getActivity().getString(resourceId);
    }


    //Buat pencocokan tampilan kustom baru yang disebut withError.
    private static Matcher<View> withError(final String expected) {
        return new TypeSafeMatcher<View>() {
            @Override
            protected boolean matchesSafely(View item) {
                if (item instanceof EditText) {
                    return ((EditText) item).getError().toString().equals(expected);
                }
                return false;
            }
            @Override
            public void describeTo(Description description) {
                description.appendText("Not found error message" + expected + ", find it!");
            }
        };
    }
}

