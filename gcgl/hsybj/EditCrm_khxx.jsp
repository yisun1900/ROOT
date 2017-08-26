<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khxm=null;
String xb=null;
String fwdz=null;
String cqbm=null;
String lxfs=null;
String hxbm=null;
String fgflbm=null;
String zxjwbm=null;
String ysbm=null;
String hxmjbm=null;
String fwmj=null;
String pmjj=null;
String hth=null;
String sjs=null;
String qye=null;
String sfyyh=null;
String yhyy=null;
String fzxm=null;
String qyrq=null;
String kgrq=null;
String zkrq=null;
String jgrq=null;
String skje=null;
String skrq=null;
String zkje=null;
String hdbz=null;
String khlxbm=null;
String ybjbh=null;
String bz=null;
String ybjss=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select ybjss,khxm,xb,fwdz,cqbm,lxfs,hxbm,fgflbm,zxjwbm,ysbm,hxmjbm,fwmj,pmjj,hth,sjs,qye,sfyyh,yhyy,fzxm,qyrq,kgrq,skje,skrq,zkje,hdbz,khlxbm,bz,zkrq,jgrq,ybjbh ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fgflbm=cf.fillNull(rs.getString("fgflbm"));
		zxjwbm=cf.fillNull(rs.getString("zxjwbm"));
		ysbm=cf.fillNull(rs.getString("ysbm"));
		hxmjbm=cf.fillNull(rs.getString("hxmjbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhyy=cf.fillNull(rs.getString("yhyy"));
		fzxm=cf.fillNull(rs.getString("fzxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		skje=cf.fillNull(rs.getString("skje"));
		skrq=cf.fillNull(rs.getDate("skrq"));
		zkje=cf.fillNull(rs.getString("zkje"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));
		zkrq=cf.fillNull(rs.getDate("zkrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		ybjss=cf.fillNull(rs.getString("ybjss"));
	}
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
<title>  核实样板间 </title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 核实样板间是否属实</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCrm_khxx.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000FF">客户姓名</font></div>
              </td>
              <td width="32%"> <%=khxm%>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0033CC">性别</font></div>
              </td>
              <td width="32%"> <%
	cf.radioToken(out, "xb","M+男&W+女",xb,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000FF">房屋地址</font></td>
              <td colspan="3"> <%=fwdz%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000FF">所属城区</font></div>
              </td>
              <td width="32%"> 
<%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> 
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0033CC">联系方式</font></div>
              </td>
              <td width="32%"> <%=lxfs%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000FF">签约额</font></div>
              </td>
              <td width="32%"> <%=qye%>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0033CC">房屋面积</font></div>
              </td>
              <td width="32%"> <%=fwmj%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000FF">签约日期</font></div>
              </td>
              <td width="32%"> <%=qyrq%>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0033CC">设计师</font></div>
              </td>
              <td width="32%"> <%=sjs%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">样板间是否属实</div>
              </td>
              <td width="32%"> 
                <select name="ybjss" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"0+未核实&Y+属实&N+不属实",ybjss);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000FF">参观样板间编号</font></div>
              </td>
              <td width="32%"><%=ybjbh%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="55" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <tr> 
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
                <div align="right"> 
                  <input type="button"  value="保存" onClick="f_do(editform)">
                </div>
              </td>
              <td width="18%" height="2"> 
                <div align="right">&nbsp;</div>
              </td>
              <td width="32%" height="2"> 
                <input type="reset"  value="重输">
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
	if(	FormName.ybjss.value=="0") {
		if ( !confirm("您没有选择是否属实，确实要继续吗?") )	{
			return false;
		}
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
