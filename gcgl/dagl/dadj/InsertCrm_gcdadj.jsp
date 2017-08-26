<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String khbh=cf.GB2Uni(request.getParameter("khbh"));
String ls_sql=null;
%>

<html>
<head>
<title>登记档案</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
.STYLE2 {color: #FF0000}
-->
</style>
</head>

<body >

<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="4%">&nbsp;</td>
	<td  width="4%">档案编码</td>
	<td  width="5%">归档标志</td>
	<td  width="15%">档案明细</td>
	<td  width="4%">数量</td>
	<td  width="5%">保管人</td>
	<td  width="11%">保管部门</td>
	<td  width="7%">开始保管时间</td>
	<td  width="5%">录入人</td>
	<td  width="7%">录入时间</td>
	<td  width="33%">备注</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();

	ls_sql="select crm_gcdagl.damxbm,DECODE(crm_gcdagl.gdbz,'Y','归档','N','已借出'),damxmc,sl,bgr,a.dwmc bgdw,bgsj,crm_gcdagl.lrr,crm_gcdagl.lrsj,crm_gcdagl.bz ";
	ls_sql+=" FROM crm_gcdagl,crm_khxx,dm_damxbm,sq_dwxx a ";
    ls_sql+=" where crm_gcdagl.khbh=crm_khxx.khbh(+)";
	ls_sql+=" and crm_gcdagl.damxbm=dm_damxbm.damxbm(+)";
	ls_sql+=" and crm_gcdagl.bgrdw=a.dwbh(+)";
	ls_sql+=" and crm_gcdagl.khbh='"+khbh+"'";
	ls_sql+=" order by khxm";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","DeleteCrm_gcdadj.jsp?khbh="+khbh);
	pageObj.setPageRow(20000);//设置每页显示记录数
	pageObj.setEditStr("删除");
	pageObj.setEditBolt("");

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.printDate();

%>
</table>

<%

String fgsbh=null;
String dwbh=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String email=null;
String sfzhm=null;
String sjs=null;
String zjxm=null;
String sgdmc=null;
String sgbz=null;

String hth=null;
String smhtbh=null;

String ywy=null;
String dadbh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;

int i=0;
try {
	conn=cf.getConnection();

	ls_sql="select fgsbh,dwbh,khxm,xb,fwdz,crm_khxx.lxfs,crm_khxx.qtdh,crm_khxx.email,crm_khxx.sfzhm,sjs,zjxm,sgdmc,crm_khxx.sgbz ";
	ls_sql+=" ,hth,smhtbh,ywy,dadbh ";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  crm_khxx.sgd=sq_sgd.sgd(+) and crm_khxx.khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dadbh=cf.fillNull(rs.getString("dadbh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		sfzhm=cf.fillNull(rs.getString("sfzhm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		sgbz=cf.fillNull(rs.getString("sgbz"));

		hth=cf.fillNull(rs.getString("hth"));
		smhtbh=cf.fillNull(rs.getString("smhtbh"));
		ywy=cf.fillNull(rs.getString("ywy"));
	}
	rs.close();
	ps.close();

%>


<form method="post" action="" name="insertform" >
  <div align="center">登记档案（客户编号：<%=khbh%>）(<font color="#FF0000"><strong>只能删除自己登记的档案</strong></font>)</div>
          
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000FF">客户姓名</font>      </td>
      <td width="32%"><%=khxm%>      </td>
      <td width="18%" align="right"><font color="#0000FF">房屋地址</font></td>
      <td width="32%"><%=fwdz%></td>
    </tr>
    
    
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000FF">设计师</font></td>
      <td width="32%"> <%=sjs%></td>
      <td width="18%" align="right"><font color="#0000FF">质检</font></td>
      <td width="32%"><%=zjxm%></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="18%" align="right"><font color="#0000FF">施工队</font></td>
      <td width="32%"> <%=sgdmc%></td>
      <td width="18%" align="right"><font color="#0000FF">班长</font></td>
      <td width="32%"><%=sgbz%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">合同号</font></td>
      <td><%=hth%></td>
      <td align="right"><font color="#0000FF">书面合同编号</font></td>
      <td><%=smhtbh%></td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><span class="STYLE2">*</span>档案袋编号</td>
      <td><input name="dadbh" type="text" value="<%=dadbh%>" size="20" maxlength="20"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
<BR>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
	<tr align="center" bgcolor="#FFFFFF">
	  <td width="16%"><strong>档案名称</strong></td>
	  <td width="6%"><strong><span class="STYLE2">*</span>数量</strong></td>
	  <td width="17%"><strong><span class="STYLE2">*</span>保管部门</strong></td>
	  <td width="9%"><strong><span class="STYLE2">*</span>保管人</strong></td>
	  <td width="10%"><strong><span class="STYLE2">*</span>保管时间</strong></td>
	  <td width="42%"><strong>备注</strong></td>
	</tr>
<%
	String damxbm=null;
	String damxmc=null;
	ls_sql="select damxbm,damxmc";
	ls_sql+=" from dm_damxbm ";
	ls_sql+=" where damxbm not in(select damxbm from crm_gcdagl where khbh='"+khbh+"') ";
	ls_sql+=" order by damxbm ";
	ps= conn.prepareStatement(ls_sql);
	rs= ps.executeQuery();
	while (rs.next())
	{
		i++;
		damxbm=rs.getString("damxbm");
		damxmc=rs.getString("damxmc");
					

			%>
			<tr align="center" bgcolor="#FFFFFF"> 
			  <td >
				<%=damxmc%>
				<input type="hidden" name="damxbm" value="<%=damxbm%>">
			  </td>
				
			  <td>
				  <input type="text" name="sl" value="" size="5" maxlength="8" >
			  </td>
			
			  <td>
				<select name="bgrdw" style="FONT-SIZE:12PX;WIDTH:152PX">
				  <option value=""></option>
				  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+fgsbh+"' and dwlx in('F0','F1','F2') and  cxbz='N' order by dwlx,dwbh",dwbh);
	%>
				</select>
			  </td>

			  <td>
				  <input name="bgr" type="text"  value="<%=yhmc%>" size="8" maxlength="20" >
			  </td>
			  <td>
				  <input type="text" name="bgsj" size="10" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)">
			  </td>
			  <td>
				  <input name="bz" type="text" value="" size="54" maxlength="200">
			  </td>
			</tr>
			<%
		
	}
	rs.close();
	ps.close();
%>

    <tr bgcolor="#FFFFFF"> 

      <td colspan="6" > 
        <div align="center"> 
		  <input type="hidden" name="bgrfgs" value="<%=fgsbh%>" >
          <input type="hidden" name="khbh"  value="<%=khbh%>" >
          <input type="button"  value="存盘" onClick="f_do(insertform)">
          <input type="button" onClick="f_gd(insertform)"  value="归档">
          <input type="reset"  value="重输">
        </div>      </td>
    </tr>
  </table>
</form>


</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.dadbh)=="") {
		alert("请输入[档案袋编号]！");
		FormName.dadbh.focus();
		return false;
	}
	if (<%=i%>==1)
	{
		if(	javaTrim(FormName.sl)!="") 
		{
			if((!isNumber(FormName.sl, "数量"))) 
			{
				return false;
			}

			if(	javaTrim(FormName.bgrdw)=="") {
				alert("请输入[保管部门]！");
				FormName.bgrdw.focus();
				return false;
			}
			if(	javaTrim(FormName.bgr)=="") {
				alert("请输入[档案保管人]！");
				FormName.bgr.focus();
				return false;
			}


			if(!(isDatetime(FormName.bgsj, "开始保管时间"))) {
				return false;
			}
			if(	javaTrim(FormName.bgsj)=="") {
				alert("请输入[开始保管时间]！");
				FormName.bgsj.focus();
				return false;
			}
		}
	}
	else if (<%=i%> > 1)
	{
		for (var j=0;j< <%=i%> ;j++ )
		{
			if(	javaTrim(FormName.sl[j])!="") 
			{
				if((!isNumber(FormName.sl[j], "数量"))) 
				{
					return false;
				}

				if(	javaTrim(FormName.bgrdw[j])=="") {
					alert("请输入[保管部门]！");
					FormName.bgrdw[j].focus();
					return false;
				}
				if(	javaTrim(FormName.bgr[j])=="") {
					alert("请输入[档案保管人]！");
					FormName.bgr[j].focus();
					return false;
				}


				if(!(isDatetime(FormName.bgsj[j], "开始保管时间"))) {
					return false;
				}
				if(	javaTrim(FormName.bgsj[j])=="") {
					alert("请输入[开始保管时间]！");
					FormName.bgsj[j].focus();
					return false;
				}
			}
		}
	}
	


	FormName.action="SaveInsertCrm_gcdadj.jsp";
	FormName.submit();

	return true;
}

function f_gd(FormName)//参数FormName:Form的名称
{
	FormName.target="";
	FormName.action="Gddj.jsp";
	FormName.submit();

	return true;
}



//-->
</SCRIPT>
