import Component from "@glimmer/component";
import { on } from "@ember/modifier";
import { action } from "@ember/object";
import didInsert from "@ember/render-modifiers/modifiers/did-insert";
import willDestroy from "@ember/render-modifiers/modifiers/will-destroy";
import { later } from "@ember/runloop";
import { service } from "@ember/service";
import icon from "discourse/helpers/d-icon";

export default class LandingPage extends Component {
  @service currentUser;
  @service router;
  @service siteSettings;

  @action
  addClass() {
    document.body.classList.add("has-landing-page");
  }

  @action
  removeClass() {
    document.body.classList.remove("has-landing-page");
  }

  @action
  scrollIntoView(event) {
    event.target.scrollIntoView({ behavior: "smooth" });
    event.preventDefault();
  }

  @action
  insertVideo(element) {
    const oldVideo = element.querySelector("video.background-video");
    if (oldVideo) {
      oldVideo.remove();
    }

    const video = document.createElement("video");
    video.setAttribute("autoplay", "");
    video.setAttribute("muted", "");
    video.setAttribute("loop", "");
    video.setAttribute("playsinline", "");
    video.className = "background-video";

    const source = document.createElement("source");
    source.src = settings.theme_uploads.background_video;
    source.type = "video/mp4";
    video.appendChild(source);
    video.appendChild(
      document.createTextNode("Your browser does not support the video tag.")
    );

    element.insertBefore(video, element.firstChild);

    video.addEventListener(
      "loadeddata",
      () => {
        video.play();
      },
      { once: true }
    );
  }

  <template>
    <div
      class="landing-page"
      {{didInsert this.insertVideo}}
      {{didInsert this.addClass}}
      {{willDestroy this.removeClass}}
    >
      <div class="intro-content">
        <div class="brand-name">Welcome to the Eclipse Jet Owners &amp; Pilots
          Association</div>
      </div>

      <div class="scroll-down page-scroll">
        <a
          class="e-btn page-scroll"
          href="#about"
          {{on "click" this.scrollIntoView}}
        >{{icon "angle-down"}}</a>
      </div>
    </div>

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
                EJOPA brings together like minded individuals that share the joy
                of aviation and the delight of flying the Eclipse Jet
              </p>
            </div>
          </div>
          <div class="row text-center content-row">
            <div class="col-md-3 col-sm-6 wow">
              <div class="about-content">
                {{icon "comments-o"}}
                <h3>Experienced Community</h3>
                <p style="text-align: left">
                  EJOPA's active forums provides essential information on all
                  aspects of Eclipse ownership. Members have contributed more
                  than 95,000 posts covering every subject matter including
                  safety, training, operations, parts, service, modifications
                  and much more!
                </p>
              </div>
            </div>
            <div class="col-md-3 col-sm-6 wow">
              <div class="about-content">
                {{icon "heart"}}
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
                {{icon "plane"}}
                <h3>Convention</h3>
                <p style="text-align: left">
                  EJOPA hosts several educational and social events, including
                  our flagship
                  <a
                    href="/convention.php"
                    style="text-decoration: underline"
                  >Annual Convention</a>. The 2024 convention will be held in
                  Fairhope, Alabama.
                </p>
              </div>
            </div>
            <div class="col-md-3 col-sm-6 wow">
              <div class="about-content">
                {{icon "key"}}
                <h3>Member Benefits</h3>
                <p style="text-align: left">
                  Timely communications with fellow Eclipse pilots and owners.
                  <br /><br />

                  Savings on your Jepp subscriptions.<br /><br />

                  Extensive library of Eclipse training videos, the perfect prep
                  before type-rating or recurrent training.
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
              <a class="e-btn e-btn-outline-dark" href="/register.php">Join
                EJOPA Today</a>
            </div>
          </div>
        </div>
      </section>

      <aside
        class="cta-quote"
        style="background-image: url('https://www.eclipsejetpilots.org/custom_uploads/frontpage/img/fp1.jpg')"
      >
        <div class="container">
          <div class="row">
            <div class="col-md-10 col-md-offset-1">
              <br /><br /><br /><br />
              <a
                class="e-btn e-btn-outline-light page-scroll"
                href="/register.php"
              >Join EJOPA Today</a>
            </div>
          </div>
        </div>
      </aside>

      <section
        class="cta-quote"
        style="background-image: url('https://www.eclipsejetpilots.org/custom_uploads/frontpage/img/fp2.jpg'); background-size: cover; height: 89vh;"
      >
        <div
          class="container-fluid"
          style="position: relative; top: 50%; transform: translateY(-50%); display: flex; align-items: center;"
        >
          <div class="row text-center">
            <div class="col-md-10 col-md-offset-1">
              <span style="font-size: 40px; line-height: 42px; color: white">We
                welcome all Eclipse owners and encourage anyone interested in
                this “gem of a jet” to join us so we can help with your purchase
                decision.<br /><br />
                It only costs $125 to join and you get immediate access.
              </span>
              <br /><br /><br /><br /><a
                class="e-btn e-btn-outline-light page-scroll"
                href="/register.php"
              >Join EJOPA Today</a>
            </div>
          </div>
        </div>
      </section>

      <aside
        class="cta-quote"
        style="background-image: url('https://www.eclipsejetpilots.org/custom_uploads/frontpage/img/fp3.jpg')"
      >
        <div class="container">
          <div class="row">
            <div class="col-md-10 col-md-offset-1">
              <span
                style="font-size: 40px; line-height: 42px; color: white"
              >EJOPA contains the most extensive body of information and
                reference material about the Eclipse aircraft, making EJOPA the
                perfect place for Eclipse owners, pilots and potential owners to
                learn about and share their Eclipse experience.
              </span>
              <br /><br /><br /><br />
              <a
                class="e-btn e-btn-outline-light page-scroll"
                href="/register.php"
              >Join EJOPA Today</a>
            </div>
          </div>
        </div>
      </aside>

      <a href="/register.php" class="e-btn e-btn-block e-btn-full-width">Become
        a Member Today!</a>

    </div>
  </template>
}
