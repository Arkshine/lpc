import { apiInitializer } from "discourse/lib/api";
import LandingPage from "../components/landing-page";

export default apiInitializer("1.8.0", (api) => {
  // see if we're on the home page
  api.renderInOutlet("after-header", LandingPage);
});
