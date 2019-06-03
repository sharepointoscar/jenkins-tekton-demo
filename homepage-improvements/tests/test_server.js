var chai =require('chai'),
chaiHttp= require('chai-http'),
 app =  require('../server'),
 should = chai.should(),
 expect  = require('chai').expect;

 chai.use(chaiHttp);


describe("GET Home page", () => {
    // Test to get all students record
    it("Should return a 200 ok response", (done) => {
         chai.request(app)
             .get('/')
             .end((err, res) => {
                 res.should.have.status(200);
                 res.should.be.html;
                 //res.body.should.be.a('object');
                 done();
              });
     });

     it("Should contain the David Wise PyeongChang 2018 as background image", (done) =>{
        chai.request(app)
        .get('/')
        .end((err, res) => {
  
            res.text.should.contain('.img-fullscreen');
            //res.text.should.contain('<img src="https://coresites-cdn.factorymedia.com/mpora_new/wp-content/uploads/2018/02/David-Wise-D15-MHPQ-02812.jpg" alt=""/>');

            res.text.should.equal('<!doctype html>\n<style>\n/*\n * Hide scrollbars\n */\n\n #wrapper {\n    overflow: hidden;\n}\n\n/*\n * Basic styles\n */\n\n.img-fullscreen {\n    position: relative;\n    overflow: hidden;\n}\n\n.img-fullscreen img {\n    vertical-align: middle;\n    position: absolute;\n    display: table;\n    margin: auto;\n    height: auto;\n    width: auto;\n    bottom: -100%;\n    right: -100%;\n    left: -100%;\n    top: -100%;\n}\n\n.img-fullscreen .full-width {\n    width: 100%;\n}\n\n.img-fullscreen .full-height {\n    height: 100%;\n}\n</style>\n<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>\n<html>\n\t<body>\n\t\t<div id="wrapper">\n\t\t\t<div class="img-fullscreen">\n\t\t\t\t<!-- switch between backtround images -->\t\n\t\t\t\t<img src="https://coresites-cdn.factorymedia.com/mpora_new/wp-content/uploads/2018/02/David-Wise-D15-MHPQ-02812.jpg" alt=""/>\n\t\t\t\t<!-- <img src="http://a.espncdn.com/media/motion/2017/0128/actn_170126_ACTN_SKI_KEVIN_ROLLAND_LIFEPROOF1201/actn_170126_ACTN_SKI_KEVIN_ROLLAND_LIFEPROOF1201.jpg" alt=""/> -->\n\t\t\t</div>\n\t\t</div>\n\t</body>\n\t<script>\n\t\tjQuery(function($) {\n\t\t\tfunction resizeImage() {\n\t\t\t\t$(\'.img-fullscreen\').each(function () {\n\t\t\t\t\tvar $imgWrp = $(this);\n\t\t\n\t\t\t\t\t$(\'img\', this).each(function () {\n\t\t\t\t\t\tvar imgW = $(this)[0].width,\n\t\t\t\t\t\t\timgH = $(this)[0].height;\n\t\t\n\t\t\t\t\t\t$(this).removeClass();\n\t\t\n\t\t\t\t\t\t$imgWrp.css({\n\t\t\t\t\t\t\twidth: $(window).width(),\n\t\t\t\t\t\t\theight: $(window).height()\n\t\t\t\t\t\t});\n\t\t\n\t\t\t\t\t\timgW / imgH < $(window).width() / $(window).height() ?\n\t\t\t\t\t\t\t$(this).addClass(\'full-width\') : $(this).addClass(\'full-height\');\n\t\t\t\t\t});\n\t\t\t\t});\n\t\t\t}\n\t\t\n\t\t\twindow.onload = function () {\n\t\t\t\tresizeImage();\n\t\t\t};\n\t\t\n\t\t\twindow.onresize = function () {\n\t\t\t\tsetTimeout(resizeImage, 300);\n\t\t\t};\n\t\t \n\t\t\tresizeImage();\n\t\t});\n\t\t</script>\n</html>');
            done();
         });
     });
 
});