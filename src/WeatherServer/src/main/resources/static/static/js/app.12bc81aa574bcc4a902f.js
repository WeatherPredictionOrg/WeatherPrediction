webpackJsonp([1],{ChhE:function(e,t){},Cvpf:function(e,t,i){"use strict";i("Qbfk");var r={data:function(){return this.toolbox={feature:{magicType:{type:["line","bar"]},saveAsImage:{}}},this.chartSettings={labelMap:{date:"日期",min:"最低气温",max:"最高气温",avg:"平均气温"},area:!0},this.extend={backgroundColor:"#FFFFFF","xAxis.0.axisLabel.color":"#E6A23C","xAxis.0.axisLabel.fontSize":16,"xAxis.0.axisLabel.fontFamily":"Arial","xAxis.0.axisLabel.fontWeight":"bold","xAxis.0.axisLabel.align":"center","yAxis.0.axisLabel.color":"#F56C6C","yAxis.0.axisLabel.fontSize":16},this.tooltip={trigger:"axis",backgroundColor:"#0D1B42",padding:15,formatter:function(e){var t="";t+="<div>"+e[0].name+"</div>";for(var i=0;i<e.length;i++)t+='<div style="color:'+e[i].color+'"><span>'+e[i].seriesName+"</span> : <span>"+(e[i].data[1]?e[i].data[1]+"°C":"暂无")+"</span></div>";return t}},this.legend={textStyle:{color:"#000000",fontSize:17,fontWeight:"bold"}},{s:"",s1:"",s2:"",dataEmpty:!0,datenumber:null,pickerOptions:{shortcuts:[{text:"最近一周",onClick:function(e){var t=new Date,i=new Date;i.setTime(i.getTime()-6048e5),e.$emit("pick",[i,t])}},{text:"最近一个月",onClick:function(e){var t=new Date,i=new Date;i.setTime(i.getTime()-2592e6),e.$emit("pick",[i,t])}},{text:"最近三个月",onClick:function(e){var t=new Date,i=new Date;i.setTime(i.getTime()-7776e6),e.$emit("pick",[i,t])}}]},chartData:{columns:["date","min","avg","max"],rows:[]},loading:!1}},mounted:function(){this.dataEmpty=!0},methods:{getData:function(){this.dataEmpty=!1,this.loading=!0,console.log("getdata...."),this.chartData.rows=[{date:"2020/7/8",min:12,avg:10,max:11},{date:"Day 2",min:35,avg:32,max:34},{date:"Day 3",min:29,avg:26,max:24},{date:"Day 4",min:17,avg:14,max:16},{date:"Day 6",min:45,avg:42,max:43},{date:"Day 7",min:38,avg:31,max:36}],this.loading=!1},created:function(){this.getData()},chooseTimeRange:function(e){this.s=e.join();var t=this.s.split(",");this.s1=t[0],this.s2=t[1]}}},o={render:function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("div",{staticClass:"block1"},[i("el-form",[i("el-form-item",[i("h1")]),e._v(" "),i("el-date-picker",{staticClass:"pot",attrs:{type:"daterange","range-separator":"~","start-placeholder":"StartDate","end-placeholder":"EndDate",format:"yyyy-MM-dd","value-format":"yyyy-MM-dd"},on:{change:e.chooseTimeRange},model:{value:e.datenumber,callback:function(t){e.datenumber=t},expression:"datenumber"}}),e._v(" "),i("el-button",{staticClass:"fis",attrs:{icon:"el-icon-search",type:"primary"},on:{click:function(t){return e.getData()}}},[e._v("Search")]),e._v(" "),i("el-form-item",[i("h1")]),e._v(" "),i("el-form-item",[i("ve-line",{attrs:{toolbox:e.toolbox,"data-empty":e.dataEmpty,loading:e.loading,data:e.chartData,settings:e.chartSettings,extend:e.extend,legend:e.legend,tooltip:e.tooltip,width:"1440px",height:"480px"}})],1)],1)],1)},staticRenderFns:[]};var n=i("VU/8")(r,o,!1,function(e){i("JTZQ")},null,null);t.a=n.exports},DxQx:function(e,t){},"FJN/":function(e,t,i){"use strict";var r={render:function(){var e=this.$createElement,t=this._self._c||e;return t("body",[t("h1",[this._v(this._s(this.msg))]),this._v(" "),t("h2",[this._v("Please Login First")]),this._v(" "),t("ul",[t("router-link",{attrs:{id:"login",to:"/login"}},[this._v("Login")])],1)])},staticRenderFns:[]};var o=i("VU/8")({name:"Welcome",data:function(){return{msg:"Welcome to My Web!"}}},r,!1,function(e){i("uEV4")},"data-v-0fabbb58",null);t.a=o.exports},JTZQ:function(e,t){},NHnr:function(e,t,i){"use strict";Object.defineProperty(t,"__esModule",{value:!0});var r=i("7+uW"),o={render:function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("body",{attrs:{id:"pos"}},[i("el-menu",{staticClass:"el-menu-demo",attrs:{"default-active":this.$route.path,router:"",mode:"horizontal","background-color":"#303133","text-color":"#fff","active-text-color":"#ffd04b","font-size":"21px"},on:{select:e.handleSelect}},e._l(e.navList,function(t,r){return i("el-menu-item",{key:r,attrs:{index:t.name}},[e._v(e._s(t.navItem))])}),1),e._v(" "),i("router-view")],1)},staticRenderFns:[]};var n=i("VU/8")({name:"App",data:function(){return{navList:[{name:"/",navItem:"HOME"},{name:"/login",navItem:"SIGN IN"},{name:"/register",navItem:"SIGN UP"}]}},methods:{handleSelect:function(e,t){}}},o,!1,function(e){i("ChhE")},null,null).exports,a=i("YaEn"),s=i("vO7p"),l=i.n(s),d=i("zL8q"),c=i.n(d),m=(i("tvR6"),i("Zcwg")),u=i.n(m),f=i("mtWM");r.default.prototype.$axios=f,r.default.config.productionTip=!1,r.default.use(c.a),r.default.use(l.a),r.default.component(u.a.name,u.a),new r.default({el:"#app",render:function(e){return e(n)},router:a.a,components:{App:n},template:"<App/>"})},Qbfk:function(e,t){},YaEn:function(e,t,i){"use strict";(function(e){var r=i("7+uW"),o=i("/ocq"),n=i("FJN/"),a=i("xJsL"),s=i("dIqY"),l=i("Cvpf");r.default.use(o.a),t.a=new o.a({mode:"history",base:e,routes:[{path:"/",name:"Welcome",component:n.a},{path:"/login",name:"login",component:a.a},{path:"/register",name:"register",component:s.a},{path:"/pickdate",name:"pickdate",component:l.a}]})}).call(t,"/")},dIqY:function(e,t,i){"use strict";var r={components:{SIdentify:i("nf3L").a},name:"register",data:function(){return{identifyCodes:"1234567890",identifyCode:"",errorInfo:!1,registerForm:{username:"",password:"",comfirmpassword:"",validate:""},rules:{username:[{required:!0,message:"Username Required",trigger:["blur","change"]}],password:[{required:!0,message:"Password Required",trigger:["blur","change"]}],comfirmpassword:[{required:!0,message:"Retype Your Password",trigger:["blur","change"]}],validate:[{required:!0,message:"Validcode Required",trigger:["blur","change"]}]},responseResult:[]}},mounted:function(){this.identifyCode="",this.makeCode(this.identifyCodes,4)},methods:{gotoLogin:function(){this.$router.push("/login")},register:function(){var e=this;this.registerForm.password!=this.registerForm.comfirmpassword?(this.$message({message:"两次密码不一致哦",type:"error"}),this.registerForm.comfirmpassword=""):this.registerForm.validate!=this.identifyCode?(this.$message({message:"验证码错误哦",type:"error"}),this.refreshCode(),this.registerForm.validate=""):this.$axios.post("/register",{username:this.registerForm.username,password:this.registerForm.password}).then(function(t){0===t.data?e.$message({message:"用户名已存在哦",type:"error"}):1===t.data&&(e.$message({message:"注册成功，请前往登录",type:"success"}),e.gotoLogin())}).catch(function(e){})},refreshCode:function(){this.identifyCode="",this.makeCode(this.identifyCodes,4)},randomNum:function(e,t){return t+=1,Math.floor(Math.random()*(t-e)+e)},makeCode:function(e,t){for(var i=0;i<t;i++)this.identifyCode+=e[this.randomNum(0,e.length-1)]}}},o={render:function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("body",{attrs:{id:"poster"}},[i("el-form",{staticClass:"register-container",attrs:{"label-position":"left","label-width":"0px",rules:e.rules,model:e.registerForm}},[i("h3",{staticClass:"register_title"},[e._v("Sign up today, it's free.")]),e._v(" "),i("el-form-item",{attrs:{prop:"username"}},[i("el-input",{attrs:{type:"text","auto-complete":"off",placeholder:"Username"},model:{value:e.registerForm.username,callback:function(t){e.$set(e.registerForm,"username",t)},expression:"registerForm.username"}})],1),e._v(" "),i("el-form-item",{attrs:{prop:"password"}},[i("el-input",{attrs:{type:"password","auto-complete":"off",placeholder:"Password"},model:{value:e.registerForm.password,callback:function(t){e.$set(e.registerForm,"password",t)},expression:"registerForm.password"}})],1),e._v(" "),i("el-form-item",{attrs:{prop:"comfirmpassword"}},[i("el-input",{attrs:{type:"password","auto-complete":"off",placeholder:"Comfirm Password"},model:{value:e.registerForm.comfirmpassword,callback:function(t){e.$set(e.registerForm,"comfirmpassword",t)},expression:"registerForm.comfirmpassword"}})],1),e._v(" "),i("el-form-item",{attrs:{prop:"validate"}},[i("el-row",[i("el-input",{staticStyle:{width:"200px"},attrs:{type:"text",placeholder:"Validcode"},model:{value:e.registerForm.validate,callback:function(t){e.$set(e.registerForm,"validate",t)},expression:"registerForm.validate"}}),e._v(" "),i("div",{staticClass:"code",on:{click:function(t){return e.refreshCode()}}},[i("s-identify",{attrs:{identifyCode:e.identifyCode}})],1)],1)],1),e._v(" "),i("el-button",{staticStyle:{"font-size":"18px","line-height":"20px",width:"100%",color:"#FFFFFF",background:"#505458",border:"none"},attrs:{type:e.primary,round:""},on:{click:function(t){return e.register()}}},[e._v("Sign up now")]),e._v(" "),i("h5"),e._v(" "),i("div",{staticClass:"line"}),e._v(" "),i("el-link",{staticStyle:{"font-size":"18px","line-height":"30px",float:"right"},attrs:{underline:!1,type:"info",icon:"el-icon-user"},on:{click:function(t){return e.gotoLogin()}}},[e._v("Already have a account? Log in here!")])],1)],1)},staticRenderFns:[]};var n=i("VU/8")(r,o,!1,function(e){i("mXe6")},null,null);t.a=n.exports},mXe6:function(e,t){},nf3L:function(e,t,i){"use strict";var r={name:"SIdentify",props:{identifyCode:{type:String,default:"1234"},fontSizeMin:{type:Number,default:35},fontSizeMax:{type:Number,default:35},backgroundColorMin:{type:Number,default:180},backgroundColorMax:{type:Number,default:240},colorMin:{type:Number,default:50},colorMax:{type:Number,default:160},lineColorMin:{type:Number,default:100},lineColorMax:{type:Number,default:200},dotColorMin:{type:Number,default:0},dotColorMax:{type:Number,default:255},contentWidth:{type:Number,default:120},contentHeight:{type:Number,default:40}},methods:{randomNum:function(e,t){return Math.floor(Math.random()*(t-e)+e)},randomColor:function(e,t){return"rgb("+this.randomNum(e,t)+","+this.randomNum(e,t)+","+this.randomNum(e,t)+")"},transparent:function(){return"rgb(255,255,255)"},drawPic:function(){var e=document.getElementById("s-canvas").getContext("2d");e.textBaseline="bottom",e.fillStyle=this.transparent(),e.fillRect(0,0,this.contentWidth,this.contentHeight);for(var t=0;t<this.identifyCode.length;t++)this.drawText(e,this.identifyCode[t],t)},drawText:function(e,t,i){e.fillStyle=this.randomColor(this.colorMin,this.colorMax),e.font=this.randomNum(this.fontSizeMin,this.fontSizeMax)+"px SimHei";var r=(i+1)*(this.contentWidth/(this.identifyCode.length+1)),o=this.randomNum(this.fontSizeMax,this.contentHeight-5),n=this.randomNum(-10,10);e.translate(r,o),e.rotate(n*Math.PI/180),e.fillText(t,0,0),e.rotate(-n*Math.PI/180),e.translate(-r,-o)},drawLine:function(e){for(var t=0;t<8;t++)e.strokeStyle=this.randomColor(this.lineColorMin,this.lineColorMax),e.beginPath(),e.moveTo(this.randomNum(0,this.contentWidth),this.randomNum(0,this.contentHeight)),e.lineTo(this.randomNum(0,this.contentWidth),this.randomNum(0,this.contentHeight)),e.stroke()},drawDot:function(e){for(var t=0;t<100;t++)e.fillStyle=this.randomColor(0,255),e.beginPath(),e.arc(this.randomNum(0,this.contentWidth),this.randomNum(0,this.contentHeight),1,0,2*Math.PI),e.fill()}},watch:{identifyCode:function(){this.drawPic()}},mounted:function(){this.drawPic()}},o={render:function(){var e=this.$createElement,t=this._self._c||e;return t("div",{staticClass:"s-canvas"},[t("canvas",{attrs:{id:"s-canvas",width:this.contentWidth,height:this.contentHeight}})])},staticRenderFns:[]},n=i("VU/8")(r,o,!1,null,null,null);t.a=n.exports},tvR6:function(e,t){},uEV4:function(e,t){},xJsL:function(e,t,i){"use strict";var r={components:{SIdentify:i("nf3L").a},name:"login",data:function(){return{identifyCodes:"1234567890",identifyCode:"",errorInfo:!1,loginForm:{username:"",password:"",validate:""},rules:{username:[{required:!0,message:"Username Required",trigger:["blur","change"]}],password:[{required:!0,message:"Password Required",trigger:["blur","change"]}],validate:[{required:!0,message:"Validcode Required",trigger:["blur","change"]}]},responseResult:[]}},mounted:function(){this.identifyCode="",this.makeCode(this.identifyCodes,4)},methods:{gotoRegister:function(){this.$router.push("/register")},login:function(){var e=this;this.loginForm.validate!=this.identifyCode?(this.$message({message:"验证码错误哦",type:"error"}),this.refreshCode(),this.loginForm.validate=""):this.$axios.post("/login",{username:this.loginForm.username,password:this.loginForm.password}).then(function(t){0===t.data?e.$message({message:"用户名不存在，请前往注册",type:"error"}):2===t.data?(e.$message({message:"密码错误哦",type:"error"}),e.loginForm.password=""):1===t.data&&(e.$message({message:"登录成功，正在跳转。。。。",type:"success"}),e.$router.push("/pickdate"))}).catch(function(e){})},refreshCode:function(){this.identifyCode="",this.makeCode(this.identifyCodes,4)},randomNum:function(e,t){return t+=1,Math.floor(Math.random()*(t-e)+e)},makeCode:function(e,t){for(var i=0;i<t;i++)this.identifyCode+=e[this.randomNum(0,e.length-1)]}}},o={render:function(){var e=this,t=e.$createElement,i=e._self._c||t;return i("body",{attrs:{id:"poster"}},[i("el-form",{staticClass:"login-container",attrs:{"label-position":"left","label-width":"0px",rules:e.rules,model:e.loginForm}},[i("h3",{staticClass:"login_title"},[e._v("SIGN IN")]),e._v(" "),i("el-form-item",{attrs:{prop:"username"}},[i("el-input",{attrs:{type:"text","auto-complete":"off",placeholder:"Username"},model:{value:e.loginForm.username,callback:function(t){e.$set(e.loginForm,"username",t)},expression:"loginForm.username"}})],1),e._v(" "),i("el-form-item",{attrs:{prop:"password"}},[i("el-input",{attrs:{type:"password","auto-complete":"off",placeholder:"Password"},model:{value:e.loginForm.password,callback:function(t){e.$set(e.loginForm,"password",t)},expression:"loginForm.password"}})],1),e._v(" "),i("el-form-item",{attrs:{prop:"validate"}},[i("el-row",[i("el-input",{staticStyle:{width:"200px"},attrs:{type:"text",placeholder:"Validcode"},model:{value:e.loginForm.validate,callback:function(t){e.$set(e.loginForm,"validate",t)},expression:"loginForm.validate"}}),e._v(" "),i("div",{staticClass:"code",on:{click:function(t){return e.refreshCode()}}},[i("s-identify",{attrs:{identifyCode:e.identifyCode}})],1)],1)],1),e._v(" "),i("el-button",{staticStyle:{"font-size":"18px","line-height":"20px",width:"100%",color:"#FFFFFF",background:"#505458",border:"none"},attrs:{type:e.primary,round:""},on:{click:function(t){return e.login()}}},[e._v("Login")]),e._v(" "),i("h5"),e._v(" "),i("div",{staticClass:"line"}),e._v(" "),i("el-form-item",[i("el-row",[i("el-link",{staticStyle:{"font-size":"18px","line-height":"30px",float:"right"},attrs:{underline:!1,type:"info",icon:"el-icon-user"},on:{click:function(t){return e.gotoRegister()}}},[e._v("Don't have a account? Create one!")])],1)],1)],1)],1)},staticRenderFns:[]};var n=i("VU/8")(r,o,!1,function(e){i("DxQx")},null,null);t.a=n.exports}},["NHnr"]);
//# sourceMappingURL=app.12bc81aa574bcc4a902f.js.map