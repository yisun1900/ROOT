<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String ssfgs=null;
String sbr=null;
String sbsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String shr=null;
String shsj=null;
String shjl=null;
String shsm=null;
String clzt=null;
String bz=null;
String ybjyxq=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qyrq=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sjjgrq=null;
String dwbh=null;
String sgd=null;
String zjxm=null;

try {
	conn=cf.getConnection();
	ls_sql="select khbh,ssfgs,sbr,sbsj,lrr,lrsj,lrbm,shr,shsj,shjl,shsm,clzt,bz,ybjyxq ";
	ls_sql+=" from  ybj_ybjsb";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		sbr=cf.fillNull(rs.getString("sbr"));
		sbsj=cf.fillNull(rs.getDate("sbsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("lrbm"));
		shr=cf.fillNull(rs.getString("shr"));
		shsj=cf.fillNull(rs.getDate("shsj"));
		shjl=cf.fillNull(rs.getString("shjl"));
		shsm=cf.fillNull(rs.getString("shsm"));
		clzt=cf.fillNull(rs.getString("clzt"));
		bz=cf.fillNull(rs.getString("bz"));
		ybjyxq=cf.fillNull(rs.getDate("ybjyxq"));
	}
	rs.close();
	ps.close();

	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qyrq,kgrq,sjkgrq,jgrq,sjjgrq,dwbh,sgd,zjxm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
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
      <div align="center">样板间--修改审批</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveXgSpEditYbj_ybjsb.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">客户编号</div>
              </td>
              <td width="32%"> <%=khbh%> </td>
              <td width="18%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="32%"> <%=khxm%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">房屋地址</div>
              </td>
              <td width="32%"> <%=fwdz%> </td>
              <td width="18%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="32%"> <%=lxfs%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">合同号</div>
              </td>
              <td width="32%"> <%=hth%> </td>
              <td width="18%"> 
                <div align="right">设计师</div>
              </td>
              <td width="32%"> <%=sjs%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">签约日期</div>
              </td>
              <td width="32%"> <%=qyrq%> </td>
              <td width="18%"> 
                <div align="right">计划开工日期</div>
              </td>
              <td width="32%"> <%=kgrq%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">实际开工日期</div>
              </td>
              <td width="32%"> <%=sjkgrq%> </td>
              <td width="18%"> 
                <div align="right">计划竣工日期</div>
              </td>
              <td width="32%"> <%=jgrq%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">实际竣工日期</div>
              </td>
              <td width="32%"> <%=sjjgrq%> </td>
              <td width="18%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right">施工队</div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="18%"> 
                <div align="right">质检</div>
              </td>
              <td width="32%"> <%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>
              </td>
              <td width="32%"> <%=khbh%> </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">所属分公司</font></div>
              </td>
              <td width="32%"> 
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs,true);
%> 
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">申报人</font></div>
              </td>
              <td width="32%"> <%=sbr%> </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">申报时间</font></div>
              </td>
              <td width="32%"> <%=sbsj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">录入人</font></div>
              </td>
              <td width="32%"> <%=lrr%> </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">录入时间</font></div>
              </td>
              <td width="32%"> <%=lrsj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">录入部门</font></div>
              </td>
              <td width="32%"> 
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+lrbm+"'",lrbm,true);
%> 
              </td>
              <td width="18%"> 
                <div align="right"><font color="#0000CC">样板间有效期</font></div>
              </td>
              <td width="32%"><%=ybjyxq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">备注</font></td>
              <td colspan="3"><%=bz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>审核人</div>
              </td>
              <td width="32%"> 
                <input type="text" name="shr" size="20" maxlength="20"  value="<%=shr%>" readonly>
              </td>
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>审核时间</div>
              </td>
              <td width="32%"> 
                <input type="text" name="shsj" size="20" maxlength="10"  value="<%=shsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font><font color="#0000CC"></font>审核结论</div>
              </td>
              <td width="32%"> 
                <select name="shjl" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"Y+合格&N+不合格",shjl);
%> 
                </select>
              </td>
              <td width="18%">&nbsp;</td>
              <td width="32%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">审核说明</td>
              <td colspan="3"> 
                <textarea name="shsm" cols="71" rows="3"><%=shsm%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.shr)=="") {
		alert("请输入[审核人]！");
		FormName.shr.focus();
		return false;
	}
	if(	javaTrim(FormName.shsj)=="") {
		alert("请输入[审核时间]！");
		FormName.shsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.shsj, "审核时间"))) {
		return false;
	}
	if(	javaTrim(FormName.shjl)=="") {
		alert("请输入[审核结论]！");
		FormName.shjl.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
