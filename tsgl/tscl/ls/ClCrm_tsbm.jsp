<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String clqk=null;
String dwmc=null;
String clsj=null;
String clr=null;
String tslxbm=null;
String tsxlbm=null;



String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));
String tsyybm=cf.GB2Uni(request.getParameter("tsyybm"));

String slfsbm=null;
String hth=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String sjs=null;
String sgd=null;
String sgbz=null;
String dwbh=null;
String zjxm=null;
String sjkgrq=null;
String sjjgrq=null;
String sfxhf=null;
String hfsj=null;
String clzt=null;
String yzcdbm=null;
String bz=null;
String yqjjsj=null;
String slbm=null;
String tsnr=null;
String tsbxsj=null;
String zrbmclzt=null;
String sfxtz=null;
String lrr=null;
String lrsj=null;
String slr=null;
String slsj=null;
String zrbm=null;

String ssfgs=null;

String cldwmc=null;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select crm_tsjl.slsj,crm_tsjl.slr,crm_tsjl.lrr,crm_tsjl.lrsj,crm_tsjl.tsbxsj,crm_tsjl.zrbmclzt,crm_tsjl.sfxtz,tsnr,slbm,crm_tsjl.bz,yzcdbm,slfsbm,hth,crm_khxx.khbh,khxm,fwdz,lxfs,qtdh,sjs,sgd,sgbz,crm_khxx.dwbh,zjxm,sjkgrq,sjjgrq,crm_tsjl.sfxhf,crm_tsjl.hfsj,clzt,crm_tsjl.yqjjsj";
	ls_sql+=" from  crm_tsjl,crm_khxx";
	ls_sql+=" where  crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh='"+tsjlh+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		slsj=cf.fillNull(rs.getDate("slsj"));
		slr=cf.fillNull(rs.getString("slr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		tsbxsj=cf.fillNull(rs.getDate("tsbxsj"));
		zrbmclzt=cf.fillNull(rs.getString("zrbmclzt"));
		sfxtz=cf.fillNull(rs.getString("sfxtz"));
		tsnr=cf.fillNull(rs.getString("tsnr"));
		slbm=cf.fillNull(rs.getString("slbm"));
		bz=cf.fillNull(rs.getString("bz"));
		yzcdbm=cf.fillNull(rs.getString("yzcdbm"));
		slfsbm=cf.fillNull(rs.getString("slfsbm"));
		hth=cf.fillNull(rs.getString("hth"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		clzt=cf.fillNull(rs.getString("clzt"));
		yqjjsj=cf.fillHtml(rs.getDate("yqjjsj"));

	}
	rs.close();

	ls_sql="select clqk,clr,clsj,crm_tsbm.dwbh,dwmc,tslxbm,tsxlbm";
	ls_sql+=" from  crm_tsbm,sq_dwxx";
	ls_sql+=" where crm_tsbm.dwbh=sq_dwxx.dwbh and tsjlh='"+tsjlh+"' and crm_tsbm.tsyybm='"+tsyybm+"'";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		clqk=cf.fillNull(rs.getString("clqk"));
		clr=cf.fillNull(rs.getString("clr"));
		clsj=cf.fillNull(rs.getDate("clsj"));
		zrbm=cf.fillNull(rs.getString("dwbh"));
		cldwmc=cf.fillNull(rs.getString("dwmc"));
		tslxbm=cf.fillNull(rs.getString("tslxbm"));
		tsxlbm=cf.fillNull(rs.getString("tsxlbm"));
	}
	rs.close();

	if (clr.equals(""))
	{
		clr=yhmc;
	}


%>

<html>
<head>
<title>处理投诉信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">客户投诉信息（<font color="#006666">投诉记录号：<%=tsjlh%></font>） 
</div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right"><font color="#0000CC">客户编号</font></div>    </td>
    <td width="33%"> <%=khbh%> </td>
    <td width="18%"> 
      <div align="right"><font color="#0000CC">合同号</font></div>    </td>
    <td width="32%"> <%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"><font color="#0000CC">客户姓名</font></td>
    <td width="33%"> <%=khxm%></td>
    <td width="18%" align="right"><font color="#0000CC">签约店面</font></td>
    <td width="32%"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC">
    <td align="right"><font color="#0000CC">电话</font></td>
    <td colspan="3"><%=lxfs%></td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"><font color="#0000CC">房屋地址</font></td>
    <td colspan="3"> <%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right"><font color="#0000CC">设计师</font></div>    </td>
    <td width="33%"> <%=sjs%> </td>
    <td width="18%"> 
      <div align="right"><font color="#0000CC">质检员</font></div>    </td>
    <td width="32%"> <%=zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%"> 
      <div align="right"><font color="#0000CC">施工队</font></div>    </td>
    <td width="33%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
    <td width="18%"> 
      <div align="right"><font color="#0000CC">施工班组</font></div>    </td>
    <td width="32%"> <%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="17%" align="right"><font color="#0000CC">实开工日期</font></td>
    <td width="33%"> <%=sjkgrq%> </td>
    <td width="18%" align="right"><font color="#0000CC">实交工日期</font></td>
    <td width="32%"> <%=sjjgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">严重程度</td>
    <td width="33%"><%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm where yzcdbm='"+yzcdbm+"'",yzcdbm,true);
%></td>
    <td width="18%" rowspan="13" align="right">投诉内容 
      <div align="right"></div>    </td>
    <td width="32%" rowspan="13" valign="top"><%=tsnr%>  </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">处理状态</td>
    <td width="33%"><%
	cf.selectToken(out,"0+未受理&1+已受理&2+在处理&3+结案&9+不立案",clzt,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">责任部门处理状态</td>
    <td width="33%"><%
	cf.selectToken(out,"1+未处理&2+在处理&3+已解决",zrbmclzt,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">需人工通知责任部门</td>
    <td width="33%"><%
	cf.selectToken(out,"Y+需通知&N+不需通知",sfxtz,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">投诉来源</td>
    <td width="33%"><%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm",slfsbm,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">客户投诉时间</td>
    <td width="33%"><%=tsbxsj%> </td>
  </tr>
  
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">是否需回访</td>
    <td width="33%"><%
	cf.selectToken(out,"Y+需回访&N+不需回访",sfxhf,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%"> 
      <div align="right">回访时间</div>    </td>
    <td width="33%"><%=hfsj%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">录入人</td>
    <td width="33%"><%=lrr%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">录入时间</td>
    <td><%=lrsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">受理人</td>
    <td width="33%"><%=slr%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right">受理时间</td>
    <td><%=slsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right"><font color="#660033">录入部门</font></td>
    <td width="33%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'",slbm,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="17%" align="right">备注</td>
    <td colspan="3"> <%=bz%> </td>
  </tr>
</table>

	<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
          <tr bgcolor="#FFFFFF" align="center"> 
            <td width="10%"> 
              <div align="center"><font color="#006666">涉及部门</font></div>
            </td>
            <td width="20%"> 
              <div align="center"><font color="#006666">原因</font></div>
            </td>
            <td width="7%"> 
              <div align="center"><font color="#006666">处理状态</font></div>
            </td>
            <td width="49%"> 
              <div align="center"><font color="#006666">处理情况</font></div>
            </td>
            <td width="8%"> 
              <div align="center"><font color="#006666">处理时间</font></div>
            </td>
            <td width="6%"> 
              <div align="center"><font color="#006666">处理人</font></div>
            </td>
          </tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	ls_sql="select dwmc,'（'||tsxlmc||'）'||tsyymc,DECODE(crm_tsbm.clzt,'1','未接收','2','已出方案','3','已解决','4','方案已审核','5','结案') clzt,crm_tsbm.clqk,crm_tsbm.clsj,crm_tsbm.clr";
	ls_sql+=" from  crm_tsbm,sq_dwxx,dm_tsxlbm,dm_tsyybm";
	ls_sql+=" where crm_tsbm.dwbh=sq_dwxx.dwbh and tsjlh='"+tsjlh+"'";
	ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.tsyybm=dm_tsyybm.tsyybm";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
	
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.alignStr[1]="align='left'";
	pageObj.alignStr[3]="align='left'";

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
</table>
	<table width="100%" border="1" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="1" cellspacing="0">
          <tr bgcolor="#FFFFFF" align="center"> 
            <td width="10%"> 
              <div align="center"><font color="#006666">回访时间</font></div>
            </td>
            <td width="62%"> 
              <div align="center"><font color="#006666">客户回访情况</font></div>
            </td>
            <td width="28%"> 
              <div align="center"><font color="#006666">回访中出现的新问题</font></div>
            </td>
          </tr>
          <%
	String khhfqk=null;
	String cxxwt=null;

	ls_sql="select hfsj,khhfqk,cxxwt";
	ls_sql+=" from  crm_tshfjl,crm_tsjlhfmx";
	ls_sql+=" where crm_tshfjl.hfjlh=crm_tsjlhfmx.hfjlh and tsjlh='"+tsjlh+"'";
	rs =stmt.executeQuery(ls_sql);
	while (rs.next())
	{
		khhfqk=cf.fillNull(rs.getString("khhfqk"));
		cxxwt=cf.fillNull(rs.getString("cxxwt"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
%> 
          <tr bgcolor="#FFFFFF"> 
            <td align="center" ><%=hfsj%></td>
            <td ><%=khhfqk%></td>
            <td ><%=cxxwt%></td>
          </tr>
<%
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
</table>


<form method="post" action="SaveCrm_tsbm.jsp" name="editform">
        <div align="center"><b>（<%=cldwmc%>）处理投诉情况</b></div>
  <table width="100%" border="1" style="FONT-SIZE:12"  cellpadding="1" cellspacing="0">
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">投诉报修大类</font></td>
      <td width="32%"> 
        <select name="tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	   cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm where tslxbm='"+tslxbm+"'",tslxbm);
%> 
        </select>      </td>
      <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">投诉报修小类</font></td>
      <td width="33%"> 
        <select name="tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	   cf.selectItem(out,"select tsxlbm,tsxlmc from dm_tsxlbm where tsxlbm='"+tsxlbm+"'",tsxlbm);
%> 
        </select>      </td>
    </tr>
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font>处理状态</td>
      <td width="32%"> 
        <select name="clzt" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectToken(out,"1+未处理&2+在处理&3+已解决","");
%> 
        </select>      </td>
      <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">投诉报修原因</font></td>
      <td width="33%"> 
        <select name="tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
	   cf.selectItem(out,"select tsyybm,tsyymc from dm_tsyybm where tsyybm='"+tsyybm+"'",tsyybm);
%> 
        </select>      </td>
    </tr>
    <tr>
      <td align="right"><strong><font color="#FF0000">客户要求解决时间</font></strong></td>
      <td><%=yqjjsj%></td>
      <td align="right"><strong><font color="#FF0000">领导要求解决时间</font></strong></td>
      <td><%=yqjjsj%></td>
    </tr>
    <tr>
      <td align="right">领导处理意见</td>
      <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
      <td align="right">领导处理人</td>
      <td>&nbsp;</td>
      <td align="right">领导处理时间</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td align="right"><font color="#FF0000">*</font>计划解决时间</td>
      <td><input type="text" name="clsj2" size="20" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)"></td>
      <td align="right">&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font>处理人</td>
      <td width="32%"> 
        <input type="text" name="clr" value="<%=clr%>" size="20" maxlength="20" >
        <input type="hidden" name="tsjlh" value="<%=tsjlh%>" >
        <input type="hidden" name="tsyybm" value="<%=tsyybm%>" >
        <input type="hidden" name="zrbm" value="<%=zrbm%>" >      </td>
      <td width="17%" align="right"><font color="#FF0000">*</font>处理时间</td>
      <td width="33%"> 
        <input type="text" name="clsj" size="20" maxlength="10" value="<%=cf.today()%>" onDblClick="JSCalendar(this)">      </td>
    </tr>
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font><font color="#0000CC">录入人</font></td>
      <td width="32%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>      </td>
      <td width="17%" align="right"><font color="#FF0000">*</font><font color="#0000CC">录入时间</font></td>
      <td width="33%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>      </td>
    </tr>
    <tr> 
      <td width="18%" align="right"><font color="#FF0000">*</font>处理情况</td>
      <td colspan="3"> 
        <textarea name="clqk" cols="87" rows="10"><%=clqk%></textarea>      </td>
    </tr>
    <tr> 
      <td colspan="4"> 
        <div align="center"> 
          <input type="button"  value="存盘" onClick="f_do(editform)" name="button">
          <input type="reset"  value="重输" name="reset">
        </div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.clzt)=="") {
		alert("请选择[处理状态]！");
		FormName.clzt.focus();
		return false;
	}
	if(	javaTrim(FormName.clr)=="") {
		alert("请输入[处理人]！");
		FormName.clr.focus();
		return false;
	}
	if(	javaTrim(FormName.clsj)=="") {
		alert("请输入[处理时间]！");
		FormName.clsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.clsj, "处理时间"))) {
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

	if(	javaTrim(FormName.clqk)=="") {
		alert("请选择[处理情况]！");
		FormName.clqk.focus();
		return false;
	}

	FormName.submit();
	return true;
}
//-->
</SCRIPT>
