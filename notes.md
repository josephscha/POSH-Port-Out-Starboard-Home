
.menu-bar {
    width: 100%;
    margin: 0px 0px 0px 0px;
    padding: 5px 5px 5px 8px;
    height: 60px;
    line-height: 100%;
    border-radius: 0px;
    -webkit-border-radius: 0px;
    -moz-border-radius: 0px;
    background: #000000;
    /* border: solid 1px #6D6D6D; */
    position: fixed;
    top: 0;
    left: 0;
    z-index:999;

  }
  .menu-bar li {
    margin: 0px 0px 6px 0px;
    padding: 0px 3px 0px 6px;
    float: left;
    position: relative;
    list-style: none;

  }
  .menu-bar a {
    font-weight: bold;
    font-family: Arial, Helvetica, sans-serif;
    font-style: normal;
    font-size: 20px;
    color: #E7E5E5;
    text-decoration: none;
    display: block;
    padding: 6px 20px 6px 16px;
    margin: 15px;
    margin-bottom: 0px;
    border-radius: 11px;
    -webkit-border-radius: 11px;
    -moz-border-radius: 11px;
    /* text-shadow: 2px 2px 0px #000000; */
  }
  .menu-bar li ul li a {
    margin: 0;
  }
  
  .menu-bar .active a, #menu-bar li:hover > a {
    background: rgb(247, 190, 4);
    color: #000000;
    -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
    -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
    box-shadow: 0 1px 1px rgba(0, 0, 0, .2);
    /* text-shadow: 2px 2px 3px #FFFFFF; */
  }
  .menu-bar ul li:hover a, #menu-bar li:hover li a {
    background: none;
    border: none;
    color: #666;
    -box-shadow: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
  }

  .menu-bar ul a:hover {
    background: #FFFFFF !important;
    color: #000000 !important;
    border-radius: 0;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    text-shadow: 2px 2px 3px #FFFFFF;
  }
  .menu-bar li:hover > ul {
    display: block;
  }
  .menu-bar ul {
    background: #000000;
    display: none;
    margin: 0;
    padding: 0;
    width: 185px;
    position: absolute;
    top: 63px;
    left: 0;
    border: solid 1px #B4B4B4;
    border-radius: 10px;
    -webkit-border-radius: 10px;
    -moz-border-radius: 10px;
    -webkit-box-shadow: 2px 2px 3px #222222;
    -moz-box-shadow: 2px 2px 3px #222222;
    box-shadow: 2px 2px 3px #222222;
  }
  .menu-bar ul li {
    float: none;
    margin: 0;
    padding: 0;
  }
  .menu-bar ul a {
    padding:20px 0px 10px 15px;
    color:#FFFFFF !important;
    font-size:12px;
    font-style:normal;
    font-family:'trebuchet ms';
    font-weight: normal;
    text-shadow: 2px 1px 0px #000000;
  }
  .menu-bar ul li:first-child > a {
    border-top-left-radius: 10px;
    -webkit-border-top-left-radius: 10px;
    -moz-border-radius-topleft: 10px;
    border-top-right-radius: 10px;
    -webkit-border-top-right-radius: 10px;
    -moz-border-radius-topright: 10px;
  }
  .menu-bar ul li:last-child > a {
    border-bottom-left-radius: 10px;
    -webkit-border-bottom-left-radius: 10px;
    -moz-border-radius-bottomleft: 10px;
    border-bottom-right-radius: 10px;
    -webkit-border-bottom-right-radius: 10px;
    -moz-border-radius-bottomright: 10px;
  }
  .menu-bar:after {
    content: ".";
    display: block;
    clear: both;
    visibility: hidden;
    line-height: 0;
    height: 0;
  }
  .menu-bar {
    display: inline-block;
  }
    html[xmlns] menu-bar {
    display: block;
  }
  * html menu-bar {
    height: 1%;
  }


