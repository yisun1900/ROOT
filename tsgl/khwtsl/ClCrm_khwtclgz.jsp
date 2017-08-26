<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String wtbh=null;
String wtflbm=null;
String wtsm=null;
String yqjjsj=null;
String slr=null;
String slsj=null;
String slbm=null;
String clzt=null;
String clr=null;
String clkssj=null;
String cljssj=null;
String clqk=null;
String bz=null;
String wherewtbh=cf.GB2Uni(request.getParameter("wtbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;

String dwbh=null;
String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String sjkgrq=null;
String sjjgrq=null;

try {
	conn=cf.getConnection();

	ls_sql="select khbh,wtbh,wtflbm,wtsm,yqjjsj,slr,slsj,slbm,clzt,clr,clkssj,cljssj,clqk,bz ";
	ls_sql+=" from  crm_khwtclgz";
	ls_sql+=" where  (wtbh='"+wherewtbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		wtbh=cf.fillNull(rs.getString("wtbh"));
		wtflbm=cf.fillNull(rs.getString("wtflbm"));
		wtsm=cf.fillNull(rs.getString("wtsm"));
		yqjjsj=cf.fillNull(rs.getDate("yqjjsj"));
		slr=cf.fillNull(rs.getString("slr"));
		slsj=cf.fillNull(rs.getDate("slsj"));
		slbm=cf.fillNull(rs.getString("slbm"));
		clzt=cf.fillNull(rs.getString("clzt"));
		clr=cf.fillNull(rs.getString("clr"));
		clkssj=cf.fillNull(rs.getDate("clkssj"));
		cljssj=cf.fillNull(rs.getDate("cljssj"));
		clqk=cf.fillNull(rs.getString("clqk"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,sjkgrq,sjjgrq,djbh,hfdjbz,djyy,djsj,djr,jhjdsj,sgbz";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));

		sgbz=cf.fillNull(rs.getString("sgbz"));
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
<title>处理客户问题</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">处理客户问题（问题编号：<%=wtbh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveClCrm_khwtclgz.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>
              </td>
              <td width="33%"><%=khbh%></td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">合同号</font></div>
              </td>
              <td width="32%"> <%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">客户姓名</font></div>
              </td>
              <td width="33%"> <%=khxm%> </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">签约店面</font></div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">房屋地址</font></td>
              <td colspan="3"> <%=fwdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">设计师</font></div>
              </td>
              <td width="33%"> <%=sjs%> </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">质检员</font></div>
              </td>
              <td width="32%"> <%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right"><font color="#0000CC">施工队</font></div>
              </td>
              <td width="33%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sgd+"'",sgd,true);
%> </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">施工班组</font></div>
              </td>
              <td width="32%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">实开工日期</font></td>
              <td width="33%"> <%=sjkgrq%> </td>
              <td width="18%" align="right"><font color="#0000CC">实交工日期</font></td>
              <td width="32%"> <%=sjjgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">问题分类</div>
              </td>
              <td width="33%"> 
                  <%
	cf.selectItem(out,"select wtflbm,wtflmc from dm_wtflbm order by wtflbm",wtflbm,true);
%> 
              </td>
              <td width="18%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="32%"> <%=lxfs%>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">问题说明</td>
              <td colspan="3"> <%=wtsm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">要求解决时间</div>
              </td>
              <td width="33%"> <%=yqjjsj%> </td>
              <td width="18%"> 
                <div align="right">客服受理时间</div>
              </td>
              <td width="32%"> <%=slsj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">客服受理人</div>
              </td>
              <td width="33%"> <%=slr%> </td>
              <td width="18%"> 
                <div align="right">录入部门</div>
              </td>
              <td width="32%"> 
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'",slbm,true);
%> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">处理状态</div>
              </td>
              <td width="33%"> 
                <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+未处理&2+在处理&3+已解决","");
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">处理人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="clr" size="20" maxlength="20"  value="<%=clr%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">处理开始时间</div>
              </td>
              <td width="33%"> 
                <input type="text" name="clkssj" size="20" maxlength="10"  value="<%=clkssj%>" >
              </td>
              <td width="18%"> 
                <div align="right">处理结束时间</div>
              </td>
              <td width="32%"> 
                <input type="text" name="cljssj" size="20" maxlength="10"  value="<%=cljssj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">处理情况</td>
              <td colspan="3"> 
                <textarea name="clqk" cols="72" rows="3"><%=clqk%></textarea>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3"><%=bz%></textarea>
              </td>
            </tr>
            <input type="hidden" name="khbh" value="<%=khbh%>" >
            <input type="hidden" name="wherewtbh"  value="<%=wherewtbh%>" >
            <tr> 
              <td colspan="4" height="2"> &nbsp; 
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
	if(	javaTrim(FormName.clzt)=="") {
		alert("请输入[处理状态]！");
		FormName.clzt.focus();
		return false;
	}
	if(	javaTrim(FormName.clr)=="") {
		alert("请输入[处理人]！");
		FormName.clr.focus();
		return false;
	}
	if(	javaTrim(FormName.clqk)=="") {
		alert("请输入[处理情况]！");
		FormName.clqk.focus();
		return false;
	}
	if(	javaTrim(FormName.clkssj)=="") {
		alert("请输入[处理开始时间]！");
		FormName.clkssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.clkssj, "处理开始时间"))) {
		return false;
	}
	if (FormName.clzt.value=="3")
	{
		if(	javaTrim(FormName.cljssj)=="") {
			alert("请输入[处理结束时间]！");
			FormName.cljssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cljssj, "处理结束时间"))) {
			return false;
		}
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
