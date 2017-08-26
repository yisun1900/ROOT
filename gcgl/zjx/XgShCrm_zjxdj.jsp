<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String fssj=null;
String dwbh=null;
String khbh=null;
String hth=null;
String khxm=null;
String dh=null;
String sgd=null;
String sgbz=null;
String zjxfsjd=null;
String zjxyysm=null;
String zjje=null;
String fwdz=null;
String sjs=null;
String dqbm=null;
String bjjb=null;
String jzbz=null;
String jzjje=null;
String kglf=null;
String kqtk=null;

String zjxm=null;
String lxfs=null;
String qyrq=null;
String wdzgce=null;
String qye=null;
String zkl=null;
String zjxje=null;
String gckk=null;
String zjxwcbz=null;

String oldgckkspbz=null;
String newzjxxh=null;
String gcjdbm=null;

String zjxxh=cf.GB2Uni(request.getParameter("zjxxh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select crm_khxx.gckkspbz,crm_khxx.gcjdbm,crm_khxx.zjxxh,crm_zjxdj.gckk,crm_zjxdj.zjxwcbz,crm_khxx.lxfs,crm_khxx.zjxm,crm_khxx.qyrq,crm_khxx.wdzgce,crm_khxx.qye,crm_khxx.zkl,crm_khxx.zjxje,crm_zjxdj.kqtk,jzjje,crm_zjxdj.kglf,fssj,dwbh,hth,crm_zjxdj.khbh,khxm,lxfs,sgd,sgbz,zjxfsjd,zjxyysm,zjje,fwdz,sjs,bjjb,crm_khxx.jzbz";
	ls_sql+=" from  crm_zjxdj,crm_khxx";
	ls_sql+=" where  crm_zjxdj.khbh=crm_khxx.khbh and crm_zjxdj.zjxxh='"+zjxxh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		oldgckkspbz=cf.fillNull(rs.getString("gckkspbz"));//工程扣款审批标志
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));//工程进度
		newzjxxh=cf.fillNull(rs.getString("zjxxh"));

		gckk=rs.getString("gckk");
		zjxwcbz=rs.getString("zjxwcbz");
		wdzgce=rs.getString("wdzgce");
		qye=rs.getString("qye");
		zkl=rs.getString("zkl");
		zjxje=rs.getString("zjxje");

		lxfs=cf.fillNull(rs.getString("lxfs"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));

		kqtk=cf.fillNull(rs.getString("kqtk"));
		jzjje=cf.fillNull(rs.getString("jzjje"));
		kglf=cf.fillNull(rs.getString("kglf"));
		fssj=cf.fillNull(rs.getDate("fssj"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		hth=cf.fillNull(rs.getString("hth"));
		khxm=cf.fillNull(rs.getString("khxm"));
		dh=cf.fillNull(rs.getString("lxfs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxfsjd=cf.fillNull(rs.getString("zjxfsjd"));
		zjxyysm=cf.fillNull(rs.getString("zjxyysm"));
		zjje=cf.fillNull(rs.getString("zjje"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		sjs=cf.fillNull(rs.getString("sjs"));
		bjjb=rs.getString("bjjb");
		jzbz=rs.getString("jzbz");

		if (gckk.equals("0"))
		{
			gckk="";
		}
	}
	rs.close();
	if (bjjb==null)
	{
		bjjb="A";
	}

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();

	if (oldgckkspbz.equals("N"))//N：未审批；Y：已审批
	{
		out.println("错误！工程扣款未审批");
		return;
	}
	if (gcjdbm.equals("5"))
	{
		out.println("错误！客户已完结，不能再修改");
		return;
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
<title>工程扣款审核</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">工程扣款--修改审核（增减项序号：<%=zjxxh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000FF">合同号</font></div>
              </td>
              <td width="35%"> <%=hth%> </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">客户姓名</font></div>
              </td>
              <td width="33%"> <%=khxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000CC">房屋地址</font></td>
              <td width="35%"><%=fwdz%></td>
              <td width="17%" align="right"><font color="#0000CC">工程担当</font></td>
              <td width="33%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000FF">电话</font></div>
              </td>
              <td width="35%"> <%=lxfs%> </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">签约日期</font></div>
              </td>
              <td width="33%"><%=qyrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000CC">签约店面</font></td>
              <td width="35%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,false);
%></td>
              <td width="17%" align="right"><font color="#0000CC">设计师</font></td>
              <td width="33%"><%=sjs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000FF">施工队</font></div>
              </td>
              <td width="35%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,false);
%> </td>
              <td width="17%"> 
                <div align="right"><font color="#0000CC">施工班组</font></div>
              </td>
              <td width="33%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="15%"><font color="#0000CC">工程原报价</font></td>
              <td width="35%"><%=wdzgce%></td>
              <td align="right" width="17%"><font color="#0000CC">折扣</font></td>
              <td width="33%"><%=zkl%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="15%"><font color="#0000CC">工程签约额</font></td>
              <td width="35%"><%=qye%></td>
              <td align="right" width="17%"><font color="#0000CC">累计增减项总额</font></td>
              <td width="33%"><%=zjxje%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="15%"><font color="#0000CC">增减项发生阶段</font></td>
              <td width="35%"> 
                <select name="zjxfsjd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select zjxfsjd,zjxfsjdmc from dm_zjxfsjd order by zjxfsjd",zjxfsjd,false);
%> 
                </select>
              </td>
              <td align="right" width="17%"><font color="#0000CC">增减项发生时间</font></td>
              <td width="33%"> 
                <input type="text" name="fssj" value="<%=fssj%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="15%"><font color="#0000CC">增减项发生总额</font></td>
              <td width="35%"> 
                <input type="hidden" name="oldzjje" value="<%=zjje%>" >
                <input type="text" name="zjje" size="10" maxlength="17"  value="<%=zjje%>" onChange="f_jzjje(editform)" readonly>
                <font color="#CC0066"><strong>增项为正，减项为负 </strong></font></td>
              <td rowspan="6" width="17%"> 
                <div align="right"><font color="#0000CC">增减项原因</font></div>
                <div align="right"></div>
              </td>
              <td rowspan="6" width="33%"> 
                <select name="zjxyybm" style="FONT-SIZE:12PX;WIDTH:152PX" size="11" multiple>
                  <option value=""></option>
                  <%
	cf.mutilSelectItem(out,"select zjxyybm,zjxyymc from dm_zjxyybm order by zjxyybm","select zjxyybm from crm_zjxyydj where zjxxh='"+zjxxh+"'");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="15%"><font color="#0000CC">减项扣管理费</font></td>
              <td width="35%"> 
                <input type="text" name="kglf" value="<%=kglf%>" size="10" maxlength="17" onChange="f_jzjje(editform)" readonly>
                <font color="#CC0066"><strong>为正数</strong></font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="15%"><font color="#0000CC">减项扣其它款</font></td>
              <td width="35%"> 
                <input type="text" name="kqtk" value="<%=kqtk%>" size="10" maxlength="17" onChange="f_jzjje(editform)" readonly>
                <font color="#CC0066"><strong>为正数</strong></font> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="15%"><font color="#0000CC">净增减金额</font></td>
              <td width="35%"> 
                <input type="text" name="jzjje" value="<%=jzjje%>" size="10" maxlength="17" readonly>
                <font color="#CC0066"><strong>扣除应扣款项后的金额</strong></font> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#0000CC">增减项完成标志</font></td>
              <td width="35%"><%
	cf.radioToken(out, "zjxwcbz","1+未完成&2+已完成",zjxwcbz,true);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right">工程扣款</td>
              <td width="35%"> 
                <input type="text" name="gckk" size="20" maxlength="17" value="<%=gckk%>">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#0000CC">增减项说明</font></div>
              </td>
              <td colspan="3"> 
                <textarea name="zjxyysm" cols="71" rows="4"><%=zjxyysm%></textarea>
              </td>
            </tr>
            <input type="hidden" name="zjxxh"  value="<%=zjxxh%>" >
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="button"  value="保存" onClick="f_do(editform)" name="bc">
                  <input type="button"  value="预览电子报价" onClick="f_dybj(editform)" name="ck">
                  <input type="reset"  value="重输">
                  <input type="hidden" name="khbh" value="<%=khbh%>" size="20" maxlength="7" readonly>
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
	if(	javaTrim(FormName.gckk)=="") {
		alert("请输入[工程扣款]！");
		FormName.gckk.select();
		return false;
	}
	if(!(isFloat(FormName.gckk, "工程扣款"))) {
		return false;
	}

	FormName.action="SaveXgShCrm_zjxdj.jsp";
	FormName.submit();
	return true;
}



function f_dybj(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("请输入[客户编号]！");
		FormName.khbh.focus();
		return false;
	}

	if ("<%=jzbz%>"=="1")
	{
		FormName.action="/gcgl/zjx/dzbj/zxbjmx/Bj_khbjmxHList.jsp?dqbm=<%=dqbm%>";
	}
	else{
		FormName.action="/gcgl/zjx/gzdzbj/zxbjmx/Bj_khbjmxHList.jsp?dqbm=<%=dqbm%>";
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
