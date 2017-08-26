<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String sgd=null;
String pdsj=null;
String hfsj=null;
String hfr=null;
String hfjl=null;
String jjyy=null;
String hsqk=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wheresgd=cf.GB2Uni(request.getParameter("sgd"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;


String khxm=null;
String cqbm=null;
String fwdz=null;
String sjs=null;
String lxfs=null;
String qyrq=null;
String kgrq=null;
String dwbh=null;
String lrsj=null;
String pmjj=null;
String qye=null;
String hdbz=null;
String khlxbm=null;
String bz=null;


try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,sgd,pdsj,hfsj,hfr,hfjl,jjyy,hsqk ";
	ls_sql+=" from  pd_pdjl";
	ls_sql+=" where  (khbh='"+wherekhbh+"') and  (sgd='"+wheresgd+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		hfr=cf.fillNull(rs.getString("hfr"));
		hfjl=cf.fillNull(rs.getString("hfjl"));
		jjyy=cf.fillNull(rs.getString("jjyy"));
		hsqk=cf.fillNull(rs.getString("hsqk"));
	}
	rs.close();


	ls_sql="select khxm,cqbm,fwdz,sjs,lxfs,qyrq,kgrq,dwbh,lrsj,pmjj,qye,hdbz,khlxbm,bz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		qye=cf.fillNull(rs.getString("qye"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
}
catch (Exception e) {
	out.print("Exception: " + e);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>拒绝派单调查</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 拒绝派单调查</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="31%"> <font color="#000000"> <%=khbh%> 
                </font></td>
              <td width="18%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="32%"> <font color="#000000"> <%=khxm%> </font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">城区</td>
              <td width="31%"> <font color="#000000"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </font></td>
              <td width="18%" align="right">房屋地址</td>
              <td width="32%"><font color="#000000"> <%=fwdz%> </font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">设计师</div>
              </td>
              <td width="31%"> <font color="#000000"> <%=sjs%> </font></td>
              <td width="18%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="32%"> <font color="#000000"> <%=lxfs%> </font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">签约日期</div>
              </td>
              <td width="31%"> <font color="#000000"> <%=qyrq%> </font></td>
              <td width="18%"> 
                <div align="right">应开工日期</div>
              </td>
              <td width="32%"> <font color="#000000"> <%=kgrq%> </font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="31%"> <font color="#000000"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </font></td>
              <td width="18%"> 
                <div align="right">录入时间</div>
              </td>
              <td width="32%"> <font color="#000000"> <%=lrsj%> </font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">签约额</td>
              <td width="31%"><font color="#000000"><%=qye%></font></td>
              <td width="18%" align="right">每平米均价</td>
              <td width="32%"><font color="#000000"><%=pmjj%></font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">回单标志</td>
              <td width="31%"> <font color="#000000"><%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,false);
%> </font></td>
              <td width="18%" align="right">客户类型</td>
              <td width="32%"> <font color="#000000"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%> </font></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">备注</td>
              <td colspan="3"><%=bz%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">被派施工队</font></div>
              </td>
              <td width="35%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='3' order by dwbh",sgd,true);
%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">派单时间</font></div>
              </td>
              <td width="35%"><%=pdsj%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">回复人</font></div>
              </td>
              <td width="35%"><%=hfr%> </td>
              <td width="15%"> 
                <div align="right"><font color="#0000CC">回复时间</font></div>
              </td>
              <td width="35%"> <%=hfsj%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">回复结论</font></div>
              </td>
              <td width="35%"> <%
	cf.selectToken(out,"0+未回复&4+接受派单&3+拒绝派单&5+保持原派",hfjl,true);
%> </td>
              <td width="15%"> 
                <div align="right"></div>
              </td>
              <td width="35%">&nbsp; </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="15%" align="right"><font color="#0000CC">拒绝原因</font></td>
              <td colspan="3"><%=jjyy%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right">核实情况</div>
              </td>
              <td colspan="3"> 
                <textarea name="hsqk" cols="55" rows="3"><%=hsqk%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <input type="hidden" name="wheresgd"  value="<%=wheresgd%>" >
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
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
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.hsqk)=="") {
		alert("请输入[核实情况]！");
		FormName.hsqk.focus();
		return false;
	}

	FormName.action="SaveDcPd_pdjl.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
