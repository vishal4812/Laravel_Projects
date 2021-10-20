import "./login.css";
import { useState, useEffect } from "react";
import CryptoJS from "crypto-js";
import Loader from "react-loader-spinner";
import { useHistory } from "react-router-dom";
import {
  encrypt_key,
  LOGIN_API_URL,
  intervalTime,
} from "../constants/frontEnd";
import axios from "axios";
const Login = () => {
  const [email, setEmail] = useState("");
  const [error, setError] = useState("");
  const [isLoading, setIsLoading] = useState(false);
  const history = useHistory();
  const emailChange = (e) => {
    setEmail(e.target.value);
  };
  useEffect(() => {
    const message = JSON.parse(localStorage.getItem("message"));
    if (message !== null) {
      setError(message.msg);
      setInterval(() => {
        setError("");
      }, intervalTime * 1000);
    }
  }, []);
  const submit = async (e) => {
    setIsLoading(true);
    e.preventDefault();
    if (localStorage.getItem("uuid") !== null && localStorage.getItem("token") !== null)
      history.push("/account");
    else {
      try {
        await axios
          .post(
            LOGIN_API_URL,
            {
              email: email,
            },
            { headers: { "Content-Type": "application/json" } }
          )
          .catch(function (error) {
            if (error.response) {
              setIsLoading(false);
              setError("Mail with link sent to your ID");
              setInterval(() => {
                setError("");
              }, intervalTime * 1000);
            }
          })
          .then((res) => {
            var uuid = CryptoJS.AES.encrypt(
              res.data.data.uuid,
              encrypt_key
            ).toString();
            var token = CryptoJS.AES.encrypt(
              res.data.data.token,
              encrypt_key
            ).toString();
            localStorage.setItem("uuid", uuid);
            localStorage.setItem("token", token);
            setIsLoading(false);
            setIsLoading(false);
            setError("Mail with link sent to your ID");
            setInterval(() => {
              setError("");
            }, intervalTime * 10000);
          });
      } catch (e) {
        console.log("error", e);
      }
    }

    setEmail("");
  };
  return (
    <>
      <div className="login-container">
        <Loader
          type="TailSpin"
          color="#00BFFF"
          height={100}
          width={100}
          visible={isLoading}
        />
        {error !== "" && <p style={{ color: "red" }}>{error}</p>}
        <div className="row">
          <div className="col-md-6 login-form-1">
            <h3>Login </h3>
            <form onSubmit={submit}>
              <div className="form-group">
                <input
                  type="email"
                  onChange={emailChange}
                  className="form-control"
                  placeholder="Your Email "
                  value={email}
                />
              </div>

              <div className="form-group">
                <input
                  type="submit"
                  className={isLoading ? "btnSubmit disabled" : "btnSubmit"}
                  disabled={isLoading}
                  value="Login"
                />
              </div>
            </form>
          </div>
        </div>
      </div>
    </>
  );
};
export default Login;
