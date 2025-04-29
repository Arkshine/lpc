import { apiInitializer } from "discourse/lib/api";
import { defaultHomepage } from "discourse/lib/utilities";
import LandingPage from "../components/landing-page";

export default apiInitializer((api) => {
  // https://github.com/discourse/discourse/pull/26291
  api.renderInOutlet("custom-homepage", LandingPage);

  const router = api.container.lookup("service:router");
  const currentUser = api.getCurrentUser();

  // After logging in, the user is redirected to /custom.
  // Redirects /custom to the default homepage.
  // Also ignores the /custom route if the user is logged out.
  router.on("routeWillChange", (transition) => {
    if (
      transition.intent?.url === "/custom" &&
      transition.to?.name === "discovery.custom"
    ) {
      transition.abort();
      router.transitionTo(currentUser ? `discovery.${defaultHomepage()}` : "/");
    }
  });
});
