<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String yhmc=(String)session.getAttribute("yhmc");
String bjjbbm=null;
String dqbm=null;
String xmmc=null;
String xmdlbm=null;
String xmxlbm=null;
String dqmc=null;
double clcb=0;
double rgcb=0;
double jxcb=0;
double cbenj=0;

String save=cf.fillNull(request.getParameter("save"));

String xmbh=cf.GB2Uni(request.getParameter("xmbh"));
String xmlrr=cf.GB2Uni(request.getParameter("lrr"));

if (save!=null && save.equals("Y"))
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("增加成功！");
	//-->
	</SCRIPT>
	<%
}
else if (save.equals("D"))
{
	%>
	<SCRIPT language=javascript >
	<!--
	alert("删除成功！");
	//-->
	</SCRIPT>
	<%
}

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

int rownum=0;

try {
	conn=cf.getConnection();


	ls_sql="SELECT bj_zdyxmb.dqbm,bjjbbm,xmmc,dqmc,xmdlmc,xmxlmc,clcb,rgcb,jxcb,cbenj";
	ls_sql+=" FROM bj_zdyxmb,dm_dqbm,bdm_xmdlbm,bdm_xmxlbm ";
	ls_sql+=" where bj_zdyxmb.lrr='"+xmlrr+"' and bj_zdyxmb.xmbh='"+xmbh+"'";
	ls_sql+=" and bj_zdyxmb.dqbm=dm_dqbm.dqbm and bj_zdyxmb.xmdlbm=bdm_xmdlbm.xmdlbm and bj_zdyxmb.xmxlbm=bdm_xmxlbm.xmxlbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=rs.getString("dqbm");
		bjjbbm=rs.getString("bjjbbm");
		xmmc=rs.getString("xmmc");
		dqmc=rs.getString("dqmc");
		xmdlbm=rs.getString("xmdlmc");
		xmxlbm=rs.getString("xmxlmc");
		clcb=rs.getDouble("clcb");
		rgcb=rs.getDouble("rgcb");
		jxcb=rs.getDouble("jxcb");
		cbenj=rs.getDouble("cbenj");
	}
	else{
		out.println("错误！项目不存在");
		return;
	}
	rs.close();
	ps.close();

%>


<html>
<head>
<title>自定义项目工料分析表</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000CC}
.STYLE2 {color: #FF0000}
.STYLE6 {color: #990000; font-weight: bold; }
-->
</style>
</head>

<body bgcolor="#FFFFFF" style='FONT-SIZE: 16px'>
<form method="post" action="" name="insertform" >
  <div align="center">自定义项目工料分析表</div>
<table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
      <tr>
        <td align="right"><span class="STYLE1">地区</span></td>
        <td><%=dqmc%></td>
        <td align="right">&nbsp;</td>
        <td></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE1">项目编号</span></td>
        <td><%=xmbh%></td>
        <td align="right"><span class="STYLE1">报价级别</span></td>
        <td><%
	cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm",bjjbbm,true);
%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE1">项目名称</span></td>
        <td colspan="3"><%=xmmc%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE1">项目大类</span></td>
        <td><%=xmdlbm%></td>
        <td align="right"><span class="STYLE1">项目小类</span></td>
        <td><%=xmxlbm%></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE6">材料成本</span></td>
        <td><span class="STYLE6"><%=clcb%></span></td>
        <td align="right"><span class="STYLE6">人工成本</span></td>
        <td><span class="STYLE6"><%=rgcb%></span></td>
      </tr>
      <tr>
        <td align="right"><span class="STYLE6">成本价</span></td>
        <td><span class="STYLE6"><%=cbenj%>          <br>
        </span></td>
        <td align="right"><span class="STYLE6">机械成本</span></td>
        <td><span class="STYLE6"><%=jxcb%></span></td>
      </tr>
      <tr bgcolor="#FFFFFF">
        <td height="24" colspan="4" align="center" bgcolor="#FFFFCC"><strong>＋＋增加材料＋＋</strong></td>
      </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span>工料分类</td>
      <td width="32%"><select name="glflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
        <%
	cf.selectItem(out,"select glflbm,glflmc from bdm_glflbm where glflbm='1' order by glflbm","");
%>
      </select></td>
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span>材料名称</td>
      <td colspan="3"><input type="text" name="glfxclmc" value="" size="73" maxlength="100"  onKeyUp="changheIn(insertform)" >       </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE2">*</span><span class="STYLE1">材料编码</span></td>
      <td><input type="text" name="glfxclbm" value="" size="20" maxlength="100"  readonly></td>
      <td align="right"><span class="STYLE2">*</span><span class="STYLE1">计量单位</span></td>
      <td><input type="text" name="jldwbm" value="" size="20" maxlength="20" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">&nbsp;</td>
      <td width="32%">
		<select name="valuelist" id="sel" style="position:absolute;WIDTH:300; left:19%;FONT-SIZE:12px;display:none" size="20" onKeyUp="changeItem(insertform,this)" onclick ="selectCk(insertform,this)">
		</select>&nbsp;</td>
      <td align="right" width="18%"><span class="STYLE2">*</span><span class="STYLE1">单价</span></td>
      <td width="32%"><input type="text" name="dj" value="" size="20" maxlength="17" readonly></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span>消耗量</td>
      <td width="32%"><input type="text" name="xhl" value="" size="20" maxlength="17" >      </td>
      <td align="right" width="18%"><span class="STYLE2">*</span>甲醛释放量</td>
      <td width="32%"><input type="text" name="jqsfl" value="0" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span>苯释放量</td>
      <td width="32%"><input type="text" name="bsfl" value="0" size="20" maxlength="17" >      </td>
      <td align="right" width="18%"><span class="STYLE2">*</span>TVOC释放量</td>
      <td width="32%"><input type="text" name="tvocsfl" value="0" size="20" maxlength="17" >      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span>类型</td>
      <td width="32%"><input name="lx" type="radio"  value="1" checked>
        打印
        <input type="radio" name="lx"  value="2">
        不打印 </td>
      <td align="right" width="18%"><span class="STYLE2">*</span>是否需要物流领料</td>
      <td width="32%"><input name="wlllbz" type="radio"  value="Y" checked>
        需要
        <input type="radio" name="wlllbz"  value="N">
        否 </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><span class="STYLE2">*</span><span class="STYLE1">录入人</span></td>
      <td width="32%"><input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="18%"><span class="STYLE2">*</span><span class="STYLE1">录入时间</span></td>
      <td width="32%"><input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%">备注</td>
      <td colspan="3"><textarea name="bz" cols="71" rows="2"></textarea>      </td>
    </tr>
    <tr align="center">
      <td colspan="4"><input type="button"  value="增加材料" onClick="f_lrcl(insertform)" >
        <input type="button"  value="增加人工" onClick="f_lrrg(insertform)" >
        <input type="button"  value="增加机械" onClick="f_lrjx(insertform)" >
          <input type="hidden" name="dqbm"  value="<%=dqbm%>" >
          <input type="hidden" name="xmbh"  value="<%=xmbh%>" >
          <input type="hidden" name="bjjbbm"  value="<%=bjjbbm%>" >
          <input type="hidden" name="xmlrr"  value="<%=xmlrr%>" >
 </td>
    </tr>
  </table>




  <table border="1" cellspacing="0" cellpadding="1" width="160%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC" align="center"> 
      <td width="3%">&nbsp;</td>
      <td width="2%">序号</td>
      <td width="3%">工料分类</td>
      <td width="5%">材料编码</td>
      <td width="8%">材料名称</td>
      <td width="7%">品牌</td>
      <td width="6%">型号</td>
      <td width="8%">规格</td>
      <td width="3%">计量单位</td>
      <td width="4%">单价</td>
      <td width="4%">消耗量</td>
      <td width="5%">金额</td>
	  <td width="3%">需物流领料</td>
	  <td width="3%">类型</td>
      <td width="4%">甲醛释放量</td>
      <td width="4%">苯释放量</td>
      <td width="4%">TVOC释放量</td>
      <td width="24%" align="left">备注</td>
    </tr>
    <%
	String bgcolor=null;
	String glbxh=null;
	String glflbm=null;
	String glfxclmc=null;
	String pp=null;
	String xh=null;
	String gg=null;
	String xl=null;
	String jldwbm=null;
	String bjjb=null;
	String glfxclbm="";
	double xhl=0;
	double dj=0;
	double je=0;
	double xjje=0;
	String lx=null;
	String wlllbz="";
	String bz=null;
	double jqsfl=0;
	double bsfl=0;
	double tvocsfl=0;

	int row=0;
	ls_sql="select glbxh,bj_zdyglfxb.glfxclbm,bj_zdyglfxb.glfxclmc,glflmc,dj,bj_zdyglfxb.jldwbm,xhl,jqsfl,bsfl,tvocsfl,DECODE(lx,'1','打印','2','不打印') lx,DECODE(wlllbz,'Y','需要','N','否') wlllbz,bj_zdyglfxb.bz ";
	ls_sql+=" ,ppmc,xh,gg ";
	ls_sql+=" FROM bj_zdyglfxb,bdm_glflbm,jxc_clbm ";
	ls_sql+=" where bj_zdyglfxb.xmlrr='"+xmlrr+"' and bj_zdyglfxb.xmbh='"+xmbh+"'";
	ls_sql+=" and bj_zdyglfxb.glflbm=bdm_glflbm.glflbm(+) ";
	ls_sql+=" and trim(bj_zdyglfxb.glfxclbm)=jxc_clbm.nbbm(+)  ";
	ls_sql+=" order by bj_zdyglfxb.glflbm,glbxh";
	ps= conn.prepareStatement(ls_sql);
//	out.println(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		rownum++;
		glbxh=rs.getString("glbxh");

		glfxclmc=rs.getString("glfxclmc");
		glfxclbm=cf.fillHtml(rs.getString("glfxclbm"));
		glflbm=rs.getString("glflmc");
		pp=cf.fillHtml(rs.getString("ppmc"));
		xh=cf.fillHtml(rs.getString("xh"));
		gg=cf.fillHtml(rs.getString("gg"));
		dj=rs.getDouble("dj");
		jldwbm=rs.getString("jldwbm");
		xhl=rs.getDouble("xhl");
		jqsfl=rs.getDouble("jqsfl");
		bsfl=rs.getDouble("bsfl");
		tvocsfl=rs.getDouble("tvocsfl");
		lx=cf.fillNull(rs.getString("lx"));
		wlllbz=cf.fillHtml(rs.getString("wlllbz"));
		bz=cf.fillHtml(rs.getString("bz"));

		je=cf.round(dj*xhl,2);
		xjje+=je;

		xjje=cf.round(xjje,2);


		if (row%2==1)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%> 
    <tr bgcolor="<%=bgcolor%>"  align="center"> 
      <td> 
        <input type="button" onClick="f_del(insertform,<%=glbxh%>)"  value="删除" ></td>
      <td><%=(row+1)%> </td>
      <td><%=glflbm%>      </td>
      <td> <%=glfxclbm%>      </td>
      <td> <%=glfxclmc%>      </td>
      <td><%=pp%></td>
      <td><%=xh%></td>
      <td><%=gg%></td>
      <td><%=jldwbm%></td>
      <td> <%=dj%>      </td>
      <td> <%=xhl%>      </td>
      <td><%=je%></td>
		<td><%=wlllbz%>		</td>
		<td><%=lx%>		</td>
      <td> <%=jqsfl%>      </td>
      <td> <%=bsfl%>      </td>
      <td> <%=tvocsfl%>      </td>
      <td> <%=bz%>      </td>
    </tr>
    <%
		row++;
	}
	rs.close();
	ps.close();

%> 
    <tr bgcolor="<%=bgcolor%>"  align="center"> 
      <td colspan="3">小计</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td><%=xjje%></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>

</body>
</html>


<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps != null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--


<%
	cf.ajax(out);//启用AJAX
%>

var lx;
//当在下拉框外单击时，下拉框消失
document.onclick=function()
{
	insertform.valuelist.style.display='none';
}


//改变输入值
function changheIn(FormName)
{   
	if(event.keyCode==13)//回车
	{
		insertform.valuelist.style.display='none';
	}
	else if(event.keyCode==38)//上箭头
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[FormName.valuelist.length-1].selected=true;
		mark="last";

		oldtext=FormName.glfxclmc.value;

		var valueStr=FormName.valuelist.options[FormName.valuelist.length-1].text;

		//编码
		var pos=valueStr.indexOf(":");
		glfxclbm=valueStr.substring(0,pos);
		FormName.glfxclbm.value=glfxclbm;
		valueStr=valueStr.substring(pos+2);

		//单价
		pos=valueStr.indexOf("￥/");
		dj=valueStr.substring(0,pos);
		FormName.dj.value=dj;
		valueStr=valueStr.substring(pos+2);

		//计量单位
		pos=valueStr.indexOf(")");
		jldwbm=valueStr.substring(0,pos);
		FormName.jldwbm.value=jldwbm;
		valueStr=valueStr.substring(pos+1);

		FormName.glfxclmc.value=valueStr;
	}
	else if(event.keyCode==40)//下箭头
	{
		FormName.valuelist.focus();
		FormName.valuelist.options[0].selected=true;
		mark="first";

		oldtext=FormName.glfxclmc.value;

		var valueStr=FormName.valuelist.options[0].text;

		//编码
		var pos=valueStr.indexOf(":");
		glfxclbm=valueStr.substring(0,pos);
		FormName.glfxclbm.value=glfxclbm;
		valueStr=valueStr.substring(pos+2);

		//单价
		pos=valueStr.indexOf("￥/");
		dj=valueStr.substring(0,pos);
		FormName.dj.value=dj;
		valueStr=valueStr.substring(pos+2);

		//计量单位
		pos=valueStr.indexOf(")");
		jldwbm=valueStr.substring(0,pos);
		FormName.jldwbm.value=jldwbm;
		valueStr=valueStr.substring(pos+1);

		FormName.glfxclmc.value=valueStr;
	}
	else{//其它键
		if(javaTrim(FormName.glfxclmc)=="") 
		{
			insertform.valuelist.style.display='none';
			return;
		}

//		alert("ddd");

		//获取型号列表
		var actionStr="GetListByAjaxZdy.jsp?dqbm=<%=dqbm%>&xmlrr=<%=xmlrr%>&xmbh=<%=xmbh%>&invalue="+FormName.glfxclmc.value;

//		window.open(actionStr);
		lx="1";
		openAjax(actionStr);  
	}

}                                                                                                                                                       


function getAjax(ajaxRetStr) 
{
	if (lx=="1")
	{
		//去除前面的换行符
		while (true)
		{
			if (ajaxRetStr.substring(0,1)=="\r")
			{
				ajaxRetStr=ajaxRetStr.substring(1);
			}
			else if (ajaxRetStr.substring(0,1)=="\n")
			{
				ajaxRetStr=ajaxRetStr.substring(1);
			}
			else{
				break;
			}
		}

		//生成下拉框
		insertform.valuelist.length=0;

		if (ajaxRetStr!="")
		{
			insertform.valuelist.style.display='block';
			strToItem3(insertform.valuelist,ajaxRetStr);
		}
		else{
			insertform.valuelist.style.display='none';
		}
	}

}

//改变下拉框条目
function changeItem(FormName,field)
{
	if(event.keyCode==38)//上箭头
	{
		if (mark=="last")
		{
			mark="";
		}

		var valueStr=field.options[field.selectedIndex].text;

		//编码
		var pos=valueStr.indexOf(":");
		glfxclbm=valueStr.substring(0,pos);
		FormName.glfxclbm.value=glfxclbm;
		valueStr=valueStr.substring(pos+2);

		//单价
		pos=valueStr.indexOf("￥/");
		dj=valueStr.substring(0,pos);
		FormName.dj.value=dj;
		valueStr=valueStr.substring(pos+2);

		//计量单位
		pos=valueStr.indexOf(")");
		jldwbm=valueStr.substring(0,pos);
		FormName.jldwbm.value=jldwbm;
		valueStr=valueStr.substring(pos+1);

		FormName.glfxclmc.value=valueStr;

		if (field.selectedIndex==0)
		{
			if (mark=="first")
			{
				field.value="";
				mark="";

				FormName.glfxclmc.value=oldtext;

				FormName.glfxclmc.focus();
			}
			else{
				mark="first";
			}
		}
	}
	else if(event.keyCode==40)//下箭头
	{
		if (mark=="first")
		{
			mark="";
		}

		var valueStr=field.options[field.selectedIndex].text;

		//编码
		var pos=valueStr.indexOf(":");
		glfxclbm=valueStr.substring(0,pos);
		FormName.glfxclbm.value=glfxclbm;
		valueStr=valueStr.substring(pos+2);

		//单价
		pos=valueStr.indexOf("￥/");
		dj=valueStr.substring(0,pos);
		FormName.dj.value=dj;
		valueStr=valueStr.substring(pos+2);

		//计量单位
		pos=valueStr.indexOf(")");
		jldwbm=valueStr.substring(0,pos);
		FormName.jldwbm.value=jldwbm;
		valueStr=valueStr.substring(pos+1);

		FormName.glfxclmc.value=valueStr;

		if (field.selectedIndex==field.length-1)
		{
			if (mark=="last")
			{
				field.value="";
				mark="";

				FormName.glfxclmc.value=oldtext
				FormName.glfxclmc.focus();
			}
			else{
				mark="last";
			}
		}
	}
	else if(event.keyCode==13)//回车
	{
		insertform.valuelist.style.display='none';
		FormName.glfxclmc.focus();
	}
}

//双击下拉框条目
function selectCk(FormName,field)
{
	insertform.valuelist.style.display='none';
	var valueStr=field.options[field.selectedIndex].text;

		//编码
		var pos=valueStr.indexOf(":");
		glfxclbm=valueStr.substring(0,pos);
		FormName.glfxclbm.value=glfxclbm;
		valueStr=valueStr.substring(pos+2);

		//单价
		pos=valueStr.indexOf("￥/");
		dj=valueStr.substring(0,pos);
		FormName.dj.value=dj;
		valueStr=valueStr.substring(pos+2);

		//计量单位
		pos=valueStr.indexOf(")");
		jldwbm=valueStr.substring(0,pos);
		FormName.jldwbm.value=jldwbm;
		valueStr=valueStr.substring(pos+1);

		FormName.glfxclmc.value=valueStr;

	FormName.glfxclmc.focus();
}


function f_lrcl(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[地区编码]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.bjjbbm)=="") {
		alert("请输入[报价级别编码]！");
		FormName.bjjbbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}
	if(	javaTrim(FormName.glflbm)=="") {
		alert("请选择[工料分类]！");
		FormName.glflbm.focus();
		return false;
	}
	if(	javaTrim(FormName.glfxclmc)=="") {
		alert("请输入[材料名称]！");
		FormName.glfxclmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请输入[计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请输入[单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "单价"))) {
		return false;
	}
	if(	javaTrim(FormName.xhl)=="") {
		alert("请输入[消耗量]！");
		FormName.xhl.focus();
		return false;
	}
	if(!(isFloat(FormName.xhl, "消耗量"))) {
		return false;
	}
	if(	javaTrim(FormName.jqsfl)=="") {
		alert("请输入[甲醛释放量]！");
		FormName.jqsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.jqsfl, "甲醛释放量"))) {
		return false;
	}
	if(	javaTrim(FormName.bsfl)=="") {
		alert("请输入[苯释放量]！");
		FormName.bsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.bsfl, "苯释放量"))) {
		return false;
	}
	if(	javaTrim(FormName.tvocsfl)=="") {
		alert("请输入[TVOC释放量]！");
		FormName.tvocsfl.focus();
		return false;
	}
	if(!(isFloat(FormName.tvocsfl, "TVOC释放量"))) {
		return false;
	}
	if(	!radioChecked(FormName.lx)) {
		alert("请选择[类型]！");
		FormName.lx[0].focus();
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}

	FormName.action="SaveInsertBj_zdyglfxb.jsp";
	FormName.submit();
	return true;
}


function f_lrrg(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[地区编码]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmlrr)=="") {
		alert("请输入[项目录入人]！");
		FormName.xmlrr.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}

	FormName.action="InsertBj_zdyglfxbRgf.jsp";
	FormName.submit();
	return true;
}


function f_lrjx(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请输入[地区编码]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xmlrr)=="") {
		alert("请输入[项目录入人]！");
		FormName.xmlrr.focus();
		return false;
	}
	if(	javaTrim(FormName.xmbh)=="") {
		alert("请输入[项目编号]！");
		FormName.xmbh.focus();
		return false;
	}

	FormName.action="InsertBj_zdyglfxbJxf.jsp";
	FormName.submit();
	return true;
}

function f_del(FormName,glbxh)//参数FormName:Form的名称
{
	if ( confirm("确实要继续吗?") )	
	{

		FormName.action="DeleteBj_zdyglfxb.jsp?glbxh="+glbxh;
		FormName.submit();
		return true;
	}
} 
//-->
</SCRIPT>
