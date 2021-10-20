import { useEffect, useState } from "react";
import CryptoJS from "crypto-js";
import { encrypt_key, AUTH_API, linkExpired } from "../constants/frontEnd";
import axios from "axios";
import Loader from "react-loader-spinner";
import { useHistory, useLocation } from "react-router-dom";
const Account = () => {
  const search = useLocation().search;
  const history = useHistory();
  const [isLoading, setIsLoading] = useState(false);
  const [loginMessage, setLoginMessage] = useState("");
  const expires = new URLSearchParams(search).get("expires");
  if (expires !== null) {
    localStorage.setItem("link", window.location.href);
    history.replace("/account");
  }
  const authenticate = async () => {
    setIsLoading(true);
    var token = localStorage.getItem("token");
    var uuid = localStorage.getItem("uuid");
    var url = localStorage.getItem("link");
    if (token === null || uuid === null) history.push("/login");
    else {
      var decryptedToken = CryptoJS.AES.decrypt(token, encrypt_key).toString(
        CryptoJS.enc.Utf8
      );
      var decrypteduuid = CryptoJS.AES.decrypt(uuid, encrypt_key).toString(
        CryptoJS.enc.Utf8
      );
    }
    try {
      await axios({
        method: "post",
        url: AUTH_API,
         maxContentLength: Infinity,
        maxBodyLength: Infinity,
        data: { uuid: decrypteduuid, url: url },
        headers: {
          Authorization: "Bearer " + decryptedToken,
          "Content-Type": "application/json",
        },
    
      }).catch(function (error) {
        if (error.response) {
          const message = {
            type:
              error.response.data.meta.message === linkExpired
                ? "failed"
                : "success",
            msg: error.response.data.meta.message,
          };
          setIsLoading(false);
          localStorage.setItem("message", JSON.stringify(message));
          if (message.type === "success") setLoginMessage(message.msg);
          else history.push("/login");
        } else if (error.request) {
          console.log("no response", error.request);
        }
        console.log(error.config);
      }).then(res =>{
        const message = {
          type:
            res.data.meta.message === linkExpired
              ? "failed"
              : "success",
          msg: res.data.meta.message,
        };
        setIsLoading(false);
        localStorage.setItem("message", JSON.stringify(message));
        if (message.type === "success") setLoginMessage(message.msg);
        else history.push("/login");
      })
    } catch (e) {
      console.log(e);
    }
  };
  const logout = () => {
    localStorage.clear();
    history.push("/login");
  };
  useEffect(() => {
    authenticate();
  }, []);
  return (
    <section className="bg-light" id="services">
      <div style={{ marginLeft: "45%" }}>
        <Loader
          type="TailSpin"
          color="#00BFFF"
          height={80}
          width={80}
          visible={isLoading}
        />
      </div>
      <div className="container px-4">
        <div className="row gx-4 justify-content-center">
          <div className="col-lg-8">
            <h2>{loginMessage}</h2>
          </div>
        </div>
        {loginMessage !== "" && (
          <button className="btn btn-danger" onClick={logout}>
            logout
          </button>
        )}
      </div>
    </section>
  );
};

export default Account;
