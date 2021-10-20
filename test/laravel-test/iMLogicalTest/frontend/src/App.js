import { Switch, Route } from "react-router-dom";
import Home from "./components/home/home";
import Footer from "./components/common/footer";
import Account from "./components/account/account";
import Login from './components/login/login';
import NavBar from './components/common/navBar';
import PageNotFound from "./components/common/pageNotFound";
function App() {
  return (
    <div>
      <NavBar />
      <Switch>
        <Route path="/" exact>
          <Home />
        </Route>
        
        <Route path="/login" exact>
          <Login />
        </Route>
        <Route path="/account">
          <Account />
        </Route>
        <Route path='*' >
          <PageNotFound />
        </Route>
      </Switch>
      <Footer />
    </div>
  );
}

export default App;
