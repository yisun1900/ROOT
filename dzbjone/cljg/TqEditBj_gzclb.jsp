<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String cldlbm=null;
String glmc=null;
String pp=null;
String xhgg=null;
double dj=0;
double wljsbz=0;
String jldwbm=null;
String jsjldwbm=null;
String jswlbm=null;
String dqbm=cf.GB2Uni(request.getParameter("dqbm"));
String wlbm=cf.GB2Uni(request.getParameter("wlbm"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="SELECT dqmc,cldlbm,wlbm,glmc,pp,xhgg,jldwbm,jsjldwbm,dj,wljsbz,lrr,lrsj,jswlbm ";
	ls_sql+="  FROM bj_jzcljgb,dm_dqbm";
	ls_sql+=" where (wlbm='"+wlbm+"' and bj_jzcljgb.dqbm=dm_dqbm.dqbm  )  ";
	//out.print(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
	    cldlbm=cf.fillNull(rs.getString("cldlbm"));
		wlbm=cf.fillNull(rs.getString("wlbm"));
		glmc=cf.fillNull(rs.getString("glmc"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		jsjldwbm=cf.fillNull(rs.getString("jsjldwbm"));
		pp=cf.fillNull(rs.getString("pp"));
		xhgg=cf.fillNull(rs.getString("xhgg"));
		dj=rs.getDouble("dj");
		wljsbz=rs.getDouble("wljsbz");
		jswlbm=cf.fillNull(rs.getString("jswlbm"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("Exception: " + e);
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

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">维护－特权</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="19%" align="right">地区</td>
              <td width="31%"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm order by dqbm",dqbm,false);
%> 
                </select>
              </td>
              <td width="18%" align="right">材料类别</td>
              <td width="32%"> 
                <select name="cldlbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select cldlbm,cldlmc from bdm_cldlbm where cldlbm='"+cldlbm+"'",cldlbm);
					%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">物流材料编码</div>
              </td>
              <td width="31%"> 
                <input type="text" name="wlbm" size="20" maxlength="16"  value="<%=wlbm%>" >
              </td>
              <td width="18%"> 
                <div align="right">物流计量单位</div>
              </td>
              <td width="32%"> 
                <select name="jldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cljldwbm,cljldwmc from bdm_cljldwbm order by cljldwmc",jldwbm);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">单价</td>
              <td width="31%"> 
                <input type="text" name="dj" size="20" maxlength="50"  value="<%=dj%>" >
              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">材料名称</td>
              <td colspan="3"> 
                <input type="text" name="glmc" size="71" maxlength="100"  value="<%=glmc%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">型号规格</div>
              </td>
              <td colspan="3"> 
                <input type="text" name="xhgg" size="71" maxlength="100"  value="<%=xhgg%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">品牌</td>
              <td colspan="3"> 
                <input type="text" name="pp" size="71" maxlength="100"  value="<%=pp%>" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="4" height="31" align="center"><b>录入与[工料分析材料]的对应关系</b></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="19%">材料名称</td>
              <td width="31%"> 
                <select name="jswlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getJswlmc(editform)">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select wlbm,glmc||NVL2(pp,'('||pp||')','') c2 from bj_jscljgb where dqbm='"+dqbm+"' and cldlbm='"+cldlbm+"' order by c2",jswlbm);
					%> 
                </select>
              </td>
              <td colspan="2" rowspan="3"><font color="#0000CC"><b>[物流/结算计量单位比值]说明： 
                <br>
                如[油漆]，物流按[桶]计量，工料分析按[L]计量 <br>
                若一桶5L，则物流结算计量单位比值＝5 <br>
                若一桶15L，则物流结算计量单位比值＝15 </b></font> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="19%">计量单位</td>
              <td width="31%"> 
                <select name="jsjldwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (!jswlbm.equals("") && jsjldwbm.equals(""))
	{
        out.println("          <option value=\"\"></option>");
		cf.selectItem(out,"select cljldwbm,cljldwmc from bdm_cljldwbm order by cljldwmc",jsjldwbm);
	}
	else{
		cf.selectItem(out,"select cljldwbm,cljldwmc from bdm_cljldwbm where cljldwbm='"+jsjldwbm+"'",jsjldwbm);
	}
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="19%">物流/结算计量单位比值</td>
              <td width="31%"> 
                <input type="text" name="wljsbz" size="20" maxlength="50"  value="<%=wljsbz%>" >
              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
                  <input type="hidden" name="wheredqbm"  value="<%=dqbm%>" >
                  <input type="hidden" name="wherewlbm"  value="<%=wlbm%>" >
                </div>
              </td>
            </tr>
          </table>
</form>

	  
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function insertItem(fie,valueStr,textStr)
{
   fie.length = fie.length+1;    
   var xh=fie.length-1;
   fie.options[xh].value =valueStr;  
   fie.options[xh].text = textStr;  

}

function getJswlmc(FormName)
{
	FormName.jsjldwbm.length=0;
	FormName.wljsbz.value="";

	if (FormName.jswlbm.value=="")
	{
		return;
	}

	var str="Bj_gzclbCx.jsp?dqbm=<%=dqbm%>&jswlbm="+FormName.jswlbm.value;
//	alert(str);
	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dqbm)=="") {
		alert("请选择[地区名称]！");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.wlbm)=="") {
		alert("请输入[物流物料编码]！");
		FormName.wlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cldlbm)=="") {
		alert("请输入[材料类别]！");
		FormName.cldlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.glmc)=="") {
		alert("请选择[材料名称]！");
		FormName.glmc.focus();
		return false;
	}
	if(	javaTrim(FormName.jldwbm)=="") {
		alert("请选择[物流计量单位]！");
		FormName.jldwbm.focus();
		return false;
	}
	if(	javaTrim(FormName.dj)=="") {
		alert("请选择[材料单价]！");
		FormName.dj.focus();
		return false;
	}
	if(!(isFloat(FormName.dj, "材料单价"))) {
		return false;
	}


	if(	javaTrim(FormName.jswlbm)=="") 
	{
		FormName.jsjldwbm.value="";
		FormName.wljsbz.value="";
	}
	else{
		if(	javaTrim(FormName.jsjldwbm)=="") {
			alert("请选择[结算计量单位]！");
			FormName.jsjldwbm.focus();
			return false;
		}
		if(	javaTrim(FormName.wljsbz)=="") {
			alert("请选择[物流结算计量单位比值]！");
			FormName.wljsbz.focus();
			return false;
		}
		if(!(isFloat(FormName.wljsbz, "物流结算计量单位比值"))) {
			return false;
		}
		if (parseFloat(FormName.wljsbz.value)<=0 )
		{
			alert("[物流/结算计量单位比值]不正确，应大于0！");
			FormName.wljsbz.select();
			return false;
		}
	}

	FormName.action="SaveTqEditBj_wljgb.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
