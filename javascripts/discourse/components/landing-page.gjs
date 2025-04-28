import Component from "@glimmer/component";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";
import concatClass from "discourse/helpers/concat-class";

export default class LandingPage extends Component {
  @service currentUser;
  @service router;
  @service siteSettings;

  get shouldRender() {
    const isHomePage = false && this.router.currentURL === "/";
    console.log("shouldRender is happening", this, this.background_video);
    // add hidden class to #main-outlet-wrapper if on home page
    return isHomePage;
  }

  get hideMainOutletWrapper() {
    console.log(
      "hideMainOutletWrapper is happening",
      this,
      settings.theme_uploads.background_video
    );
    const isHomePage = this.router.currentURL === "/";
    document.addEventListener("DOMContentLoaded", () => {
      if (isHomePage) {
        const mainOutletWrapper = document.querySelector(
          "#main-outlet-wrapper"
        );
        console.log("isHomePage is true");
        if (mainOutletWrapper) {
          mainOutletWrapper.classList.add("hidden");
        }
      } else {
        const mainOutletWrapper = document.querySelector(
          "#main-outlet-wrapper"
        );
        if (mainOutletWrapper) {
          mainOutletWrapper.classList.remove("hidden");
        }
      }
    });
    // add hidden class to #main-outlet-wrapper if on home page
    if (isHomePage) {
      const mainOutletWrapper = document.querySelector("#main-outlet-wrapper");
      console.log("isHomePage is true");
      if (mainOutletWrapper) {
        mainOutletWrapper.classList.add("hidden");
      }
    } else {
      const mainOutletWrapper = document.querySelector("#main-outlet-wrapper");
      if (mainOutletWrapper) {
        mainOutletWrapper.classList.remove("hidden");
      }
    }
  }
  get button() {
    return this.args.button;
  }

  <template>
    {{#if this.shouldRender}}
      <div class="landing-page">
        <video autoplay muted loop class="background-video">
          <source
            src="{{settings.theme_uploads.background_video}}"
            type="video/mp4"
          />
          Your browser does not support the video tag.
        </video>
        <div class="landing-page__content">
          <section id="about">
            <div class="container-fluid">
              <div class="row text-center">
                <div class="col-lg-12 wow">
                  <h1>
                    Dedicated to the safe, economical and fun operation of the
                    Eclipse Jet
                  </h1>
                  <p>
                    EJOPA brings together like minded individuals that share the
                    joy of aviation and the delight of flying the Eclipse Jet
                  </p>
                </div>
              </div>
              <div class="row text-center content-row">
                <div class="col-md-3 col-sm-6 wow">
                  <div class="about-content">
                    <i class="fa fa-comments-o fa-4x"></i>
                    <h3>Experienced Community</h3>
                    <p style="text-align: left">
                      EJOPA's active forums provides essential information on
                      all aspects of Eclipse ownership. Members have contributed
                      more than 95,000 posts covering every subject matter
                      including safety, training, operations, parts, service,
                      modifications and much more!
                    </p>
                  </div>
                </div>
                <div class="col-md-3 col-sm-6 wow">
                  <div class="about-content">
                    <i class="fa fa-heart fa-4x"></i>
                    <h3>Advocacy</h3>
                    <p style="text-align: left">
                      EJOPA provides an unvarnished two-way communication link
                      between Eclipse Aerospace and our members. We actively
                      advocate on behalf of our membership, which currently
                      represents two-thirds of the Eclipse Jet fleet.
                    </p>
                  </div>
                </div>
                <div class="col-md-3 col-sm-6 wow">
                  <div class="about-content">
                    <i class="fa fa-plane fa-4x"></i>
                    <h3>Convention</h3>
                    <p style="text-align: left">
                      EJOPA hosts several educational and social events,
                      including our flagship
                      <a
                        href="/convention.php"
                        style="text-decoration: underline"
                      >Annual Convention</a>. The 2024 convention will be held
                      in Fairhope, Alabama.
                    </p>
                  </div>
                </div>
                <div class="col-md-3 col-sm-6 wow">
                  <div class="about-content">
                    <i class="fa fa-key fa-4x"></i>
                    <h3>Member Benefits</h3>
                    <p style="text-align: left">
                      Timely communications with fellow Eclipse pilots and
                      owners.
                      <br /><br />

                      Savings on your Jepp subscriptions.<br /><br />

                      Extensive library of Eclipse training videos, the perfect
                      prep before type-rating or recurrent training.
                      <a
                        style="text-decoration: underline"
                        href="https://vimeo.com/160978077"
                        data-lity
                      >Watch Sample</a>
                    </p>
                  </div>
                </div>
              </div>

              <div class="row text-center">
                <div class="col-lg-12 wow">
                  <a class="btn btn-outline-dark" href="/register.php">Join
                    EJOPA Today</a>
                </div>
              </div>
            </div>
          </section>

          <aside
            class="cta-quote"
            style="background-image: url('custom_uploads/frontpage/img/fp1.jpg')"
          >
            <div class="container">
              <div class="row">
                <div class="col-md-10 col-md-offset-1">
                  <br /><br /><br /><br />
                  <a
                    class="btn btn-outline-light page-scroll"
                    href="/register.php"
                  >Join EJOPA Today</a>
                </div>
              </div>
            </div>
          </aside>

          <section
            class="cta-quote"
            style="
        background-image: url('custom_uploads/frontpage/img/fp2.jpg');
        height: 100%;
        background-size: cover;
      "
          >
            <div
              class="container-fluid"
              style="
          position: relative;
          top: 50%;
          -webkit-transform: translateY(-50%);
          -ms-transform: translateY(-50%);
          transform: translateY(-50%);
        "
            >
              <div class="row text-center">
                <div class="col-md-10 col-md-offset-1">
                  <span
                    style="font-size: 40px; line-height: 42px; color: white"
                  >We welcome all Eclipse owners and encourage anyone interested
                    in this “gem of a jet” to join us so we can help with your
                    purchase decision.<br /><br />
                    It only costs $125 to join and you get immediate access.
                  </span>
                  <br /><br /><br /><br /><a
                    class="btn btn-outline-light page-scroll"
                    href="/register.php"
                  >Join EJOPA Today</a>
                </div>
              </div>
            </div>
          </section>

          <aside
            class="cta-quote"
            style="background-image: url('custom_uploads/frontpage/img/fp3.jpg')"
          >
            <div class="container">
              <div class="row">
                <div class="col-md-10 col-md-offset-1">
                  <span
                    style="font-size: 40px; line-height: 42px; color: white"
                  >EJOPA contains the most extensive body of information and
                    reference material about the Eclipse aircraft, making EJOPA
                    the perfect place for Eclipse owners, pilots and potential
                    owners to learn about and share their Eclipse experience.
                  </span>
                  <br /><br /><br /><br />
                  <a
                    class="btn btn-outline-light page-scroll"
                    href="/register.php"
                  >Join EJOPA Today</a>
                </div>
              </div>
            </div>
          </aside>

          <a href="/register.php" class="btn btn-block btn-full-width">Become a
            Member Today!</a>

        </div>
      </div>
      {{this.hideMainOutletWrapper}}
    {{/if}}
  </template>
}
