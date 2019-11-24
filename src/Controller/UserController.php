<?php


namespace App\Controller;

class UserController extends AbstractController
{
    public function getDistance($latitude1, $longitude1, $latitude2, $longitude2)
    {
        $earthRadius = 6371;

        $latFrom = deg2rad($latitude1);
        $lonFrom = deg2rad($longitude1);
        $latTo = deg2rad($latitude2);
        $lontTo = deg2rad($longitude2);

        $latDelta = $latTo - $latFrom;
        $lonDelta = $lontTo - $lonFrom;

        $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) +
                cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));
        return $angle * $earthRadius;
    }

    public function index()
    {
        $comment = '';
        $userEmail = 'customer@iscooter.com';
        $userPassword = '';
        $userName = 'Doe';
        $userFirstname = 'John';
        $userAddress1 = '';
        $userAddress2 = '';
        $userCity = '';
        $userZip = '';

        if (!empty($_SESSION['userEmail']) && !empty($_SESSION['userPassword'])) {
            $userEmail = $_SESSION['userEmail'];
        }
        if (!empty($_POST['name'])) {
            $_SESSION['name'] = $_POST['name'];
        }
        if (!empty($_POST['firstname'])) {
            $_SESSION['firstname'] = $_POST['firstname'];
        }
        if (!empty($_POST['address1'])) {
            $_SESSION['address1'] = $_POST['address1'];
        }
        if (!empty($_POST['address2'])) {
            $_SESSION['address2'] = $_POST['address2'];
        }
        if (!empty($_POST['city'])) {
            $_SESSION['city'] = $_POST['city'];
        }
        if (!empty($_POST['zip'])) {
            $_SESSION['zip'] = $_POST['zip'];
        }

        if (isset($_SESSION['userEmail'])) {
            $userPassword = $_SESSION['userPassword'];
        }
        if (isset($_SESSION['name'])) {
            $userName = $_SESSION['name'];
        }
        if (isset($_SESSION['firstname'])) {
            $userFirstname = $_SESSION['firstname'];
        }
        if (isset($_SESSION['address1'])) {
            $userAddress1 = $_SESSION['address1'];
        }
        if (isset($_SESSION['address2'])) {
            $userAddress2 = $_SESSION['address2'];
        }
        if (isset($_SESSION['city'])) {
            $userCity = $_SESSION['city'];
        }
        if (isset($_SESSION['zip'])) {
            $userZip = $_SESSION['zip'];
        }

        $error = '';
        $fileExtension = '';
        $finalPicture = 'assets/images/uploads/default-profile.jpg';
        if (!empty($_FILES)) {
            $name = $_FILES['file']['name'];
            $error = '';
            $tmp_name = $_FILES['file']['tmp_name'];
            $position = strpos($name, ".");
            $fileExtension = substr($name, $position + 1);
            $fileExtension = strtolower($fileExtension);

            if (isset($name)) {
                $path = 'assets/images/uploads/';
                if (empty($name)) {
                    $error = "Please choose a file";
                } elseif (!empty($name)) {
                    if (($fileExtension !== "jpg") && ($fileExtension !== "jpeg")
                        && ($fileExtension !== "png") && ($fileExtension !== "bmp")) {
                        $error = "The file extension must be .jpg, .jpeg, .png, or .bmp in order to be uploaded";
                    } elseif (($fileExtension == "jpg") || ($fileExtension == "jpeg")
                        || ($fileExtension == "png") || ($fileExtension == "bmp")) {
                        if (move_uploaded_file($tmp_name, $path . $name)) {
                            $error = 'Uploaded!';
                            $picture = $path . $name;
                            $_SESSION['picture'] = $picture;
                        }
                    }
                }
            }
        }
        if (isset($_SESSION['picture'])) {
            $finalPicture = $_SESSION['picture'];
        }

        /*----------- TESTING JS API --------------------*/

        //getting datas from mapbox API

        $roundedDistance = 'undefined';
        $sendToJs1 = [];

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (!empty($_POST['city'])) {
                //Lyon, Rue Delandine
                $latitude1 = 45.7444;
                $longitude1 = 4.8253;
                $distance = 'undefined';

                $baseUrl = 'https://api.mapbox.com/geocoding/v5/mapbox.places/';
                $search = urlencode($_POST['city']);
                $token = '.json?access_token=pk.eyJ1IjoibHVvd2VuIiwiYSI6ImNrMnE1Z'.
                    'TJnazA4NWQzZW1vZXljYWg1NmwifQ.MkqZuE6WAw6bHKDg43JCFw';
                $url = $baseUrl . $search . $token;
                $data = file_get_contents($url);
                $geoLocalization = json_decode($data);
                $info = $geoLocalization->features;
                if (!empty($info)) {
                    $longitudeFromMapBox = $info[0]->bbox[0];
                    $latitudeFromMapBox = $info[0]->bbox[1];
                    $bbox = $info[0]->bbox;
                    $sendToJs = json_encode($bbox);
                    $sendToJs1 = [$latitudeFromMapBox, $longitudeFromMapBox];
                    $distance = $this->getDistance($latitude1, $longitude1, $latitudeFromMapBox, $longitudeFromMapBox);
                    $roundedDistance = round($distance);
                }
            }
        }

        if (!empty($_SESSION['comment']) && isset($_SESSION['comment'])) {
            $comment = $_SESSION['comment'];
        }

        return $this->twig->render('User/user.html.twig', [
            'userEmail' => $userEmail,
            'userPassword' => $userPassword,
            'userName' => $userName,
            'userFirstname' => $userFirstname,
            'userAddress1' => $userAddress1,
            'userAddress2' => $userAddress2,
            'userCity' => $userCity,
            'userZip' => $userZip,
            'userPicture' => $finalPicture,
            'uploadError' => $error,
            'distance' => $roundedDistance,
            'sendToMapBox' => $sendToJs1,
            'comment' => $comment,
        ]);
    }

    public function logout()
    {
        session_destroy();
        header('location: /home/index');

        $this->twig->render('User/user.html.twig');
    }
}
