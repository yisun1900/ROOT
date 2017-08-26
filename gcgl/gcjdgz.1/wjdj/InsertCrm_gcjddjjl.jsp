<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String lrdw=(String)session.getAttribute("dwbh");
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String qyrq=null;
String dwbh=null;
String sgd=null;
String sgbz=null;
String zjxm=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String zt=null;
String jjwjbz=null;
String zjxwcbz=null;
double khjsje=0;
String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String djjlh=null;
String kbxbz=null;
String bxkssj=null;
String bxjzsj=null;
String bybxsm=null;
String gcjdbm=null;

try {
	conn=cf.getConnection();

	ls_sql="select zjxwcbz,gcjdbm,bxkssj,bxjzsj,kbxbz,bybxsm,zt,jjwjbz,crm_khxx.khxm,fwdz,lxfs,hth,sjs,qye,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,dwbh,sgd,sgbz,zjxm,khjsje";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxwcbz=cf.fillNull(rs.getString("zjxwcbz"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		bxkssj=cf.fillNull(rs.getDate("bxkssj"));
		bxjzsj=cf.fillNull(rs.getDate("bxjzsj"));
		kbxbz=cf.fillNull(rs.getString("kbxbz"));
		bybxsm=cf.fillNull(rs.getString("bybxsm"));
		zt=cf.fillNull(rs.getString("zt"));
		jjwjbz=cf.fillNull(rs.getString("jjwjbz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		khjsje=rs.getDouble("khjsje");
	}
	rs.close();
	ps.close();

	if (zt.equals("2") && sjjgrq.equals(""))
	{
		out.println("错误！未进行[完工登记]，不能进行[竣工验收登记]");
		return;
	}

	if (gcjdbm.equals("5"))
	{
		out.println("<BR>！！！错误，客户已竣工验收");
		return;
	}

	if (!jjwjbz.equals("Y"))
	{
//		out.println("<BR>！！！错误，客户家居未竣工验收");
//		return;
	}

	sjkgrq="";

	int count=0;
	ls_sql="select NVL(max(substr(djjlh,8,2)),0)";
	ls_sql+=" from  crm_gcjddjjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();


	djjlh=khbh+cf.addZero(count+1,2);
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


<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">实际竣工验收登记 （登记记录号：<%=djjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveInsertCrm_gcjddjjl.jsp" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
              客户姓名              </td>
              <td width="32%"> <%=khxm%></td>
              <td width="18%" align="right"> 
              合同号              </td>
              <td width="32%"><%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">房屋地址</td>
              <td width="32%"><%=fwdz%></td>
              <td width="18%" align="right">工程担当</td>
              <td width="32%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
              签约店面              </td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="18%" align="right"> 
              设计师              </td>
              <td width="32%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
              签约日期              </td>
              <td width="32%"><%=qyrq%> </td>
              <td width="18%" align="right"> 
              工程签约额              </td>
              <td width="32%"> <%=qye%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"> 
              施工队              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="18%" align="right"> 
              班长              </td>
              <td width="32%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">合同开工日期</td>
              <td width="32%"><font color="#000000"><%=kgrq%></font></td>
              <td width="18%" align="right">合同竣工日期</td>
              <td width="32%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">实际开工日期</td>
              <td width="32%"><font color="#000000"><%=sjkgrq%></font></td>
              <td width="18%" align="right">实际竣工日期</td>
              <td width="32%"><font color="#000000"><%=sjjgrq%></font></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td width="18%" align="right"><font color="#FF0000">*</font>工程进度</td>
              <td width="32%">
                <select name="gcjdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select gcjdbm,gcjdmc from  dm_gcjdbm order by gcjdbm","5",false);
%> 
              </select>              </td>
              <td width="18%" align="right">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font>实际竣工验收日期              </td>
              <td width="32%">
              <input type="text" name="djsj" value="<%=cf.today()%>" size="20" maxlength="10" >              </td>
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font>可保修标志              </td>
              <td width="32%"><%
	cf.radioToken(out, "kbxbz","Y+保修&M+部分保修&N+不保修",kbxbz);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">不予保修说明</td>
              <td colspan="3"> 
                <textarea name="bybxsm" cols="71" rows="3"><%=bybxsm%></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font><font color="#0000FF">录入人</font>              </td>
              <td width="32%"> 
              <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font><font color="#0000FF">录入时间</font>              </td>
              <td width="32%"> 
              <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"> 
              <font color="#FF0000">*</font><font color="#0000FF">录入单位</font>              </td>
              <td width="32%"> 
                <select name="lrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrdw+"'",lrdw);
%> 
              </select>              </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"></textarea>              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <input type="hidden" name="djjlh" value="<%=djjlh%>" >
                <input type="hidden" name="khbh" value="<%=khbh%>" >
                <input type="button"  value="存盘" onClick="f_do(insertform)">
                <input type="reset"  value="重输" name="reset">              </td>
            </tr>
        </table>
</form>
	  
    </td>
  </tr>
</table>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.djjlh)=="") {
		alert("请输入[登记记录号]！");
		FormName.djjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.gcjdbm)=="") {
		alert("请选择[工程进度]！");
		FormName.gcjdbm.focus();
		return false;
	}
	if(	javaTrim(FormName.djsj)=="") {
		alert("请输入[实际竣工验收日期]！");
		FormName.djsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.djsj, "实际竣工验收日期"))) {
		return false;
	}

	if(	!radioChecked(FormName.kbxbz)) {
		alert("请选择[可保修标志]！");
		FormName.kbxbz[0].focus();
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
	if(	javaTrim(FormName.lrdw)=="") {
		alert("请选择[录入单位]！");
		FormName.lrdw.focus();
		return false;
	}
	if(	javaTrim(FormName.bz)=="") {
		alert("请输入[备注]！");
		FormName.bz.focus();
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>

