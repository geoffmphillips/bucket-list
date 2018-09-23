<div id="app">
  <v-app id="inspire">
    <v-jumbotron>
      <v-container fill-height>
        <v-layout align-center>
          <v-flex>

            <div class="jumbotron-wrapper">
              <video class="jumbotron" type="video/mp4" autoplay loop muted>
                <source src="https://d2ezlykacdqcnj.cloudfront.net/_assets/home-video/beach-waves-loop.mp4" type="video/mp4">
              </video>
              <div class="video-overlay"></div>
              <div class="page-width">
                <div class="video-hero--content">
                  <h2>Background Video Demo</h2>
                  <p>Full width video hero</p>
                </div>
              </div>
            </div>

          </v-flex>
        </v-layout>
      </v-container>
    </v-jumbotron>
  </v-app>
</div>

<style>
  .jumbotron-wrapper {
    position: relative;
  	overflow: hidden;
  	background-position: center center;
  	background-repeat: no-repeat;
    background-size: cover;
  }
  .jumbotron {
    position: absolute;
  	min-width: 100%;
  	min-height: 100%;
  	width: auto;
  	height: auto;
  	top: 50%;
  	left: 50%;
    object-fit: contain;
    transform: translate(-50%,-50%);
  }
</style>
