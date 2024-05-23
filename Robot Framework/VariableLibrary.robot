*** Settings ***
Library     SeleniumLibrary
Resource    integrationResources.robot


*** Variables ***
#    ***Suite Setup***
#${Browser}     chrome
${Browser}     headlesschrome
${URL}      https://teamgardanetgame-development.azurewebsites.net/
${BROWSER_OPTIONS}    add_argument("--headless"); 

#    ***LogIn***
${ADMIN}    kund@iths.se
${ADMINPASSWORD}    GardaNetGame123!
${CustomerEmail}    a@a.se
${CustomerPassword}    Asd123!
${LoggedIn}     True
${LoggedOut}    False

#    ***NavBar***
${NavBarLogotype}    //img[@id='navlogo']
${dropDownMenu}    //a[@id='dropdownMenuButton']
${LogOutOption}    //button[@id="logouttab"]
${ManageWebsiteTab}    //a[@id='ManageWebsiteTab']    #Placeholder until admin tab is fixed
${ManageEventOption}    //a[@id='manageEventTab']
${ManageAccountOption}    //a[@id='manageaccounttab']
${LogInTab}    //a[@id='logintab'] 
${RegisterTab}    //a[@id='registertab']
${Home}    //a[@id='hometab']
${eventTab}    //a[@id='eventtab']
${storeTab}    //*[@id="gametab"]

#    ***AdminPageMenu***
${ManageEventOption}    //a[@id='manageEventTab']
${ManageEventTypeOption}    //a[@id='manageEventTypeTab']
${ManageGameOption}    //a[@id='manageGameTab']
${ManageGenresOption}    //a[@id='manageGenresTab']
${ManageOrderOption}    //a[@id='manageOrderTab']


#    ***Landing Page***

${landingPageTitle}    //*[@id="navlogo"]

${EventLinkButton}    //button[@id='EventLinkButton']

${RightClickCarousel}    //span[@id='carouselnexticon']
${LeftClickCarousel}    //span[@id='carouselprevicon']
${LandingPageImage}    




#    ***Login Page***
${LoginEmailField}    //input[@id='inputemail']
${LoginPasswordField}    //input[@id='inputpassword']
${LogInSubmitButton}     //button[@id='loginsubmitbutton']



#    ***EventOverviewFunctions***
${EXPECTED_EVENT_TEXT}
${EXPECTED_EVENT_NUMBER}    6


#    ***EventOverviewPage***
${eventOverviewTitle}                            #DoesNotExist!!

${NewestEventSeeMoreButton}    //*[@id='cardbutton.1']
${eventTitleText}    Event                              #placeholder id for event page

#    ***EventDetailPage***
${eventBuyButton}    //button[@id='buy_event']

#    ---ManageEventPage---
#*** Event form Xpaths***
${EventChoiceForm}     //*[@id="EventChoiceDropdown"]
${eventTypeForm}    //select[@id='EventTypeSelector']
${eventNameForm}    //*[@id="Name"]
${eventDateForm}    //*[@id="Date"]
${eventLocationForm}    //*[@id="Location"]
${eventDescriptionForm}     //*[@id="description"]
${eventAgeRestrictionForm}      //*[@id="AgeRestriction"]
${eventImageUrlForm}     //*[@id="eventImageUrl"]
${eventBackgroundImageForm}     //*[@id="backgroundImageUrl"]
${eventDurationForm}     //*[@id="duration"]
${eventCapacityFrom}     //*[@id="capacity"]
${eventPriceForm}     //*[@id="price"]
${eventIsUpcoming}    //input[@id='isUpcoming']

#*** Event form Variables***
${eventType}    269a8100-4eff-4f52-8a00-217e4148eff9
${eventName}    Test Event
${eventDate}    00202405111900
${eventFalseDate}   87745685
${eventLocation}    Test Location
${eventDescription}     This is a test-event
${eventAgeRestriction}      16
${eventImageUrl}     https://sv.wikipedia.org/wiki/LAN-party#/media/Fil:Winter_2004_DreamHack_LAN_Party.jpg
${eventBackgroundImage}     https://cdn.al.to/i/setup/images/prod/big/product-new-big,,2017/10/pr_2017_10_3_8_6_51_252_00.jpg
${eventDuration}     4
${eventCapacity}     25
${eventPrice}     250
${EventDateFormat1}    05110020241900
${EventDateFormat2}    11050020241900
${CorrectDateFormat}    2024-05-11T19:00



${changedEventName}    Changes for Test
${WrongDateFormatErrorMessage}    The DateTimeVariable field must be a date and time.

#***Event buttons***
${submitEvent}   //*[@id="submiteventbutton"]
${deleteEvent}  //*[@id="deleteeventbutton"]
${buyEvent}     //*[@id="buy_event"]
${eventInfoButton}      //*[@id="cardbutton.1"]


#***Store***
${gameOne}     //*[@id="gamecardbutton.1"]
${BuyButton}    //button[@id='buy_Games']
${gameCardOne}    //h5[@id='cardtitle.1']
${GamePageTitle}    //h1[@id='storePageTitle']

#***Checkout***
${KlarnaButton}    //button[@class='btn btn-warning mt-2']




#***Manage Games form***
${SelectGameForm}    //select[@id='GameChoiceDropdown']
${GameTitleForm}    //input[@id='Name']
${SelectGenreForm}    //select[@id='GenreSelector']
${ReleaseDateForm}    //input[@id='PublicationDate']
${StudioForm}    //input[@id='GameDeveloper']
${PublisherForm}    //input[@id='Publisher']
${GameDescriptionForm}    //textarea[@id='description']
${AgeRestrictionForm}    //input[@id='AgeRestriction']
${MultiplayerForm}    //input[@id='NumberOfPlayers']
${GamePriceForm}    //input[@id='price']
${PlatformForm}    //input[@id='Platform']
${VideoForm}    //input[@id='VideoTrailer']
${SystemRequirementForm}    //input[@id='SystemRequirement']
${OnlineFunctionalityForm}    //input[@id='OnlineFuntionality']
${GameSubmitButton}    //button[@id='submitgamebutton']
${GameDeleteButton}    //button[@id='deletegamebutton']

#***Manage Game Form Variables***
${GameTitle}    Final Fantasy 7
${selectGenre}  RPG
${releaseDate}  0019970131
${studio}   Square
${publisher}    Square
${gameDescription}  Klassiskt rollspel
${ageRestriction}   12
${Multiplayer}    Nej
${GamePrice}    199
${Platform}     Steam
${Video}    https://www.youtube.com/embed/utVE4aUKYuY
${SystemRequirement}    Windows 10 Minne 4GB
${OnlineFunctionality}  Offline
${GameNameChange}    Ändrat Namn
${CorrectReleaseDateFormat}    1997-01-31
${ReleaseDateFormat1}    0131001997
${ReleaseDateFormat2}    01311997

#***Footer***

${faq}  //*[@id="faqButton"]
${contactUs}    //*[@id="emailButton"]
${facebook}     //*[@id="facebookButton"]
${map}      //*[@id="mapDiv"]
${aboutUsButton}    //a[@id='aboutUsButton']


#***Faq***
${faqPage}      //*[@id="FAQPageTitle"]
${question}     //*[@id="headingOne"]
${questionNameForm}     //*[@id="faqUserName"]
${questionMailForm}     //*[@id="faqUserEmail"]
${userQuestionForm}     //*[@id="faqQuestion"]
${sendQuestionButton}   css:button.btn.btn-primary


#***Faq Variables***
${questionName}   Nils-Erik
${questionMail}     nils.erik@iths.se
${userQuestion}     Hej, jag är intresserad av era event.

#***Register user***
${registerMailForm}     css:input[name='Input.Email']
${registerMail}     r@r
${registerPasswordForm}     css:input[name='Input.Password']
${registerPasswordConfirmForm}      css:input[name='Input.ConfirmPassword']
${registerPassword}     GardaNetgame123!
${registerAccountButton}    //*[@id="registeraccountbutton"]
${emailConfirmLink}    //a[@id='emailConfirmationLink']
${alreadyRegisteredAlert}    //div[@role='alert']
${registerButton}    //button[@id='registerButton']


#***Klarna***
${klarnaMailForm}   //*[@id="billing-email__container"]
${klarnaZipCodeForm}    //*[@id="billing-postal_code"]
${klarnaZipCode}    41265

#***Manage account***
${manageEmail}    //a[@id='ManageEmail']
${manageProfile}    //a[@id='ManageProfile']
${managePassword}    //a[@id='ManagePassword']
${manageAutentication}    //a[@id='TwoFactorAuthentication']
${personalData}    //a[@id='PersonalData']
${deleteAccountButton}    //a[@id='removeAccount']
${PasswordFormDeleteAccount}    //input[@placeholder='Please enter your password.']
${ConfirmDeleteAccountButton}    //button[normalize-space()='Ta bort data och stäng mitt konto']


${profileNameForm}    //input[@id='FullNameForm']
${profileDateForm}    //input[@id='DateOfBirthForm']
${profileAdressForm}    //input[@id='AddressForm']
${profilePhoneNumberForm}    //input[@id='PhoneNumberForm']
${saveProfileButton}    //button[@id='SaveButton']

${newEmailForm}    //input[@id='NewEmailForm']
${ChangeEmailButton}    //button[@id='ChangeEmailSubmitButton']
${oldPasswordForm}
${newPasswordForm}
${newPasswordConfirmForm}
${updatePasswordButton}    


#***Manage account variables***
${profileName}      Carl
${profileDate}      0019911224
${profileAdress}    Överarmsgatan 12
${profilePhoneNumber}   0735073566
${newEmail}     b@b.se
${newPassword}  Asd123!


#***manage Event Types***

${eventTypeDropDown}   //*[@id="eventTypeNamn"]
${eventTypeNewNameForm}    //*[@id="eventTypeType"]
${eventTypeUpdateAddButton}     //*[@id="eventTypeSubmitButton"]
${EventTypeRemoveButton}        //*[@id="eventTypeSumbitButton"]
${eventTypeNewName}     Gala
${eventTypeChangedName}     Dans på Logen

#***manage game Genre***

${genreDropdown}    //*[@id="GenreChoiceDropdown"]
${genreNameForm}    //*[@id="Name"]
${genreUpdateAddButton}     //*[@id="submitgenrebutton"]
${genreRemoveButton}        //*[@id="deletegenrebutton"]
${genreName}    Splatter
${genreChangedName}     Moba