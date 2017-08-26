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

<body bgcolor="#FFFFFF">


<%
String ssfgs=(String)session.getAttribute("ssfgs");
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面

String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=request.getParameter("khbh");
String xgjlh=null;
 
String hth=null;
String khxm=null;
String fwdz=null;
String fgsbh= null;
String dwbh= null;
String sjsbh= null;
String sjs= null;
String sjsgh= null;
String khjl= null;
double wdzgce= 0;
double qye= 0;
double suijin= 0;
double suijinbfb= 0;
double sjf= 0;
double glf= 0;
double guanlif= 0;
double zkl= 0;
String cxhdbm=null;
String cxhdbmxq=null;
String cxhdbmzh=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;



try {
	conn=cf.getConnection();

	ls_sql="select hth,khxm,fwdz,fgsbh,dwbh,sjsbh,khjl,sjs,sjsgh,wdzgce,zkl,qye,suijin,suijinbfb,sjf,glf,guanlif,cxhdbm,cxhdbmxq,cxhdbmzh";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		khjl=cf.fillNull(rs.getString("khjl"));
		sjsgh=cf.fillNull(rs.getString("sjsgh"));
		wdzgce=rs.getDouble("wdzgce");
		zkl=rs.getDouble("zkl");
		qye=rs.getDouble("qye");
		suijin=rs.getDouble("suijin");
		suijinbfb=rs.getDouble("suijinbfb");
		sjf=rs.getDouble("sjf");
		glf=rs.getDouble("glf");
		guanlif=rs.getDouble("guanlif");
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
	}
	rs.close();
	ps.close();


	int count=0;
	ls_sql="select NVL(max(substr(xgjlh,8,2)),0)";
	ls_sql+=" from  crm_dmsjsxgjl";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();
	
	xgjlh=khbh+cf.addZero(count+1,2);

	
	}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}


%>


<form method="post" action="SaveInsertCrm_qyexgjl.jsp" name="insertform" target="_blank">
<div align="center">修改－设计师店面 </div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000FF">修改记录号</font></td>
      <td width="32%"> 
        <input type="text" name="xgjlh" value="<%=xgjlh%>" size="20" maxlength="9" reaonly>      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000FF">客户编号</font></td>
      <td width="31%"> 
        <input type="text" name="khbh" value="<%=khbh%>" size="20" maxlength="20" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">合同号</font></td>
      <td width="32%"> <%=hth%> </td>
      <td align="right" width="19%"><font color="#0000FF">客户姓名</font></td>
      <td width="31%"> <%=khxm%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">房屋地址</font></td>
      <td colspan="3"><%=fwdz%> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">修改前分公司</font></td>
      <td width="32%"> 
        <select name="xgqfgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'",fgsbh);
%> 
        </select>      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font>修改后分公司</td>
      <td width="31%">
		<select name="xghfgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changeFgs(insertform)">
		<%
			if (kfgssq.equals("2"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"') order by dwbh",fgsbh);
			}
			else if (kfgssq.equals("5"))//0：不授权；1：授权单个分公司；2：授权多个分公司；3：授权单个店面；4：授权某一分公司多个店面；5：授权多个分公司多个店面
			{
				out.println("<option value=\"\"></option>");
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh in(select ssfgs from sq_sqbm where ygbh='"+ygbh+"') order by dwbh",fgsbh);
			}
			else if (kfgssq.equals("1") || kfgssq.equals("3") || kfgssq.equals("4"))
			{
				cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",fgsbh);
			}
			else{
				out.println("错误！未进行客户资料授权，请联系系统管理员");
				return;
			}
		%> 
		</select>   </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">修改前签约店面</font></td>
      <td width="32%"> 
        <select name="xgqdwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
        </select>      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font>修改后签约店面</td>
      <td width="31%"> 
        <select name="xghdwbh" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getSjs(insertform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and cxbz='N' and ssfgs='"+fgsbh+"' order by dwbh",dwbh);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#0000FF">修改前设计师</font></td>
      <td width="32%"> 
        <input type="text" name="xgqsjs" value="<%=sjs%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font>修改后设计师</td>
      <td width="31%"> 
        <select name="xghsjs" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and sq_yhxx.zwbm='04' and sq_yhxx.sfzszg in('Y','N') order by yhmc",sjs);
%> 
        </select>      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right"><font color="#0000FF">修改前客户经理</font></td>
      <td><input type="text" name="xgqkhjl" value="<%=khjl%>" size="20" maxlength="20" readonly></td>
      <td align="right">修改后客户经理</td>
      <td><select name="xghkhjl" style="FONT-SIZE:12PX;WIDTH:152PX" >
        <option value=""></option>
        <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+dwbh+"' and sq_yhxx.zwbm='03' and sq_yhxx.sfzszg in('Y','N') order by yhmc",khjl);
%>
      </select></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000FF">录入人</font></td>
      <td width="32%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td align="right" width="19%"><font color="#FF0000">*</font><font color="#0000FF">录入时间</font></td>
      <td width="31%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000FF">录入部门</font></td>
      <td width="32%"> 
        <select name="lrbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm);
%> 
        </select>      </td>
      <td align="right" width="19%">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">备注</td>
      <td colspan="3"> 
        <textarea name="bz" cols="73" rows="3"></textarea>      </td>
    </tr>
    <tr align="center"> 
      <td colspan="4"> 
        <input type="button"  value="存盘" onClick="f_do(insertform)">
        <input type="reset"  value="重输" name="reset">      </td>
    </tr>
  </table>
</form>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function addItem(field1,str)
{
	strToItem(field1,str);
}

function getSjs(FormName)
{
	if (FormName.xghdwbh.value=='')
	{
		return;
	}

	FormName.xghsjs.length=1;

	var str="Crm_khxxCx.jsp?xghdwbh="+FormName.xghdwbh.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function changeFgs(FormName)
{
	if (FormName.xghfgsbh.value=='')
	{
		return;
	}

	FormName.xghdwbh.length=1;
	FormName.xghsjs.length=1;


	var str="Crm_khxxCx.jsp?xghfgsbh="+FormName.xghfgsbh.value;

	parent.menu.aform.action=str;
	parent.menu.aform.submit();
}

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.xgjlh)=="") {
		alert("请输入[修改记录号]！");
		FormName.xgjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xghfgsbh)=="") {
		alert("请输入[修改后分公司]！");
		FormName.xghfgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.xghdwbh)=="") {
		alert("请输入[修改后签约店面]！");
		FormName.xghdwbh.focus();
		return false;
	}

	if(	javaTrim(FormName.xghsjs)=="") {
		alert("请输入[修改后设计师]！");
		FormName.xghsjs.focus();
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
	if(	javaTrim(FormName.lrbm)=="") {
		alert("请输入[录入部门]！");
		FormName.lrbm.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
