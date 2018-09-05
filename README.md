# xCORE VocalFusion Stereo 4-Mic Kit for AVS and Amazon Alexa Voice Services SDK on a Raspberry Pi

The XMOS **xCORE VocalFusion Stereo 4-Mic Kit for AVS** provides far-field voice capture using the XMOS XVF3500 voice processor.

Combined with a Raspberry Pi running the Amazon Alexa Voice Service (AVS) Software Development Kit (SDK), this kit allows you to quickly prototype and evaluate talking with Alexa.

To find out more, visit: https://xmos.com/vocalfusion-avs  
and: https://developer.amazon.com/alexa-voice-service

This repository provides a simple-to-use automated script to install the Amazon AVS SDK on a Raspberry Pi and configure the Raspberry Pi to use the **xCORE VocalFusion Stereo 4-Mic Kit for AVS** for audio.

## Prerequisites
You will need:

- **xCORE VocalFusion Stereo 4-Mic Kit for Amazon AVS**: XK-VF3500-L33-AVS
- Raspberry Pi 3
- Micro-USB power supply (min. 2A)
- MicroSD card (min. 16GB)
- Powered mono speaker with audio 3.5mm analogue plug
- Monitor with HDMI input
- HDMI cable
- Fast-Ethernet connection with internet connectivity

You will also need an Amazon Developer account: https://developer.amazon.com

## Hardware setup
Setup your hardware by following the **Hardware Setup** at: https://www.xmos.com/published/vocalfusion-stereo-dev-kit-for-amazon-avs-hardware-setup-guide

## AVS SDK installation and Raspberry Pi audio setup
The **Getting Started Guide** available from http://www.xmos.com/published/vocalfusion-stereo-dev-kit-for-amazon-avs-getting-started-guide details setup steps up until this point. What follows are setup steps specific to the AVS SDK.

1. Install Raspbian (Stretch) on the Raspberry Pi as described in the Getting Started Guide.

2. Clone the vocalfusion-stereo-avs-setup repository:

   ```git clone https://github.com/xmos/vocalfusion-stereo-avs-setup```

3. Register Alexa with AVS by following http://github.com/alexa/alexa-avs-sample-app/wiki/Create-Security-Profile.

   Note: The *Allowed Origins* and *Allowed Return URLs* should be entered as **http**, not **https**.

   Note: It can be easier to configure your new Alexa device and Amazon developer account from a browser on your Raspberry Pi, as you can then easily copy the *ProductID*, *ClientID* and *ClientSecret* keys.

4. Run the installation script by entering `./auto_install.sh`. Read and accept the AVS Device SDK license agreement.

5. You will be prompted enter your Alexa device details and asked whether you want the Sample App to run automatically when the Raspberry Pi boots. Your Alexa device details are the *ProductID*, the *ClientID* and *ClientSecret* keys as generated in the previous step. You will also be prompted to enter a serial number and define your location.

6. Read and accept the Sensory license agreement. Wait for the script to complete the installation. The script is configuring the Raspberry Pi audio system, downloading and updating dependencies, building and configuring the AVS Device SDK. It takes around 30 minutes to complete.

7. As a final step, the script will open http://localhost:3000 in a browser on the Raspberry Pi. Enter your Amazon Developer credentials and close the browser window when prompted. (You won't have to do this if you already have a valid configuration file.) If you see a `400 Bad Request - HTTP` error it may be necessary to add http:// URLs to your device origins and return fields. To do this, go to your amazon developer AVS home page (https://developer.amazon.com/avs/home.html) and from `My products` select `manage` and then `security profile`. Now add http://localhost:3000 to the `Allowed origins` and http://localhost:3000/authresponse to the `Allowed return URLs`. Now refresh the browser window with the original error.

8. Enter `sudo reboot` to reboot the Raspberry Pi and complete the installation.

## Running the AVS SDK Sample App
The automated installation script creates a number of aliases which can be used to execute the AVS Device SDK client, or run the unit tests:
- `avsrun` to run the Sample App.
- `avsauth` to re-authenticate your Alexa device details (invoke Amazon's `avs_auth.sh`).
- `avsunit` to run the unit tests (invoke Amazon's `avs_test.sh`).
- `avssetup` to re-install the Sample App (re-run XMOS modified `setup.sh`).

## Using different Amazon details
To change client and product ID, run `avssetup`. It will ask you to type in your IDs and invoke `avsauth` for you. As a result the SDK JSON file will be updated so subsequent `avsrun` can use the new details.
