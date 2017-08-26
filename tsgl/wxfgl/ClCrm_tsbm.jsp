<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String clqk=null;
String dwmc=null;
String clsj=null;
String clr=null;
String tslxbm=null;
String tsxlbm=null;


String tsjlh=cf.GB2Uni(request.getParameter("tsjlh"));

String slfsbm=null;
String hth=null;
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String sgd=null;
String sgbz=null;
String dwbh=null;
String zjxm=null;
String sjkgrq=null;
String sjjgrq=null;
String sfxhf=null;
String hfsj=null;
String slr=null;
String clzt=null;
String yzcdbm=null;
String bz=null;
String yqjjsj=null;
String slbm=null;
String tsnr=null;
String wxsgd=null;

double wxrgf=0;
double wxcf=0;
double wxclf=0;
double wxzfy=0;
double cjcdfy=0;
double sgdcdfy=0;
double khcdfy=0;
double gscdfy=0;
double qtfcdfy=0;

String ssfgs=null;

String cldwmc=null;


Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select wxsgd,tsnr,slbm,crm_tsjl.bz,yzcdbm,slfsbm,hth,crm_khxx.khbh,khxm,fwdz,lxfs,sjs,sgd,sgbz,crm_khxx.dwbh,zjxm,sjkgrq,sjjgrq,crm_tsjl.sfxhf,crm_tsjl.hfsj,slr,clzt,crm_tsjl.yqjjsj";
	ls_sql+=" from  crm_tsjl,crm_khxx";
	ls_sql+=" where  crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wxsgd=cf.fillNull(rs.getString("wxsgd"));
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
		sjs=cf.fillNull(rs.getString("sjs"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfsj=cf.fillNull(rs.getDate("hfsj"));
		slr=cf.fillNull(rs.getString("slr"));
		clzt=cf.fillNull(rs.getString("clzt"));
		yqjjsj=cf.fillNull(rs.getDate("yqjjsj"));

	}
	rs.close();
	ps.close();

	ls_sql="select wxrgf,wxcf,wxclf,wxzfy,cjcdfy,sgdcdfy,khcdfy,qtfcdfy,gscdfy";
	ls_sql+=" from  crm_wxfmx";
	ls_sql+=" where tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		wxrgf=rs.getDouble("wxrgf");
		wxcf=rs.getDouble("wxcf");
		wxclf=rs.getDouble("wxclf");
		wxzfy=rs.getDouble("wxzfy");
		cjcdfy=rs.getDouble("cjcdfy");
		sgdcdfy=rs.getDouble("sgdcdfy");
		khcdfy=rs.getDouble("khcdfy");
		qtfcdfy=rs.getDouble("qtfcdfy");
		gscdfy=rs.getDouble("gscdfy");
	}
	rs.close();
	ps.close();
%>

<html>
<head>
<title>处理报修信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF" style="FONT-SIZE:14">
<div align="center">客户报修信息（<font color="#006666">报修记录号：<%=tsjlh%></font>） 
</div>
<table width="100%" border="1" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="0">
  <tr bgcolor="#FFFFCC"> 
    <td colspan="4" bgcolor="#FFFFCC"> 
      <div align="center"> 
        <input type="hidden" name="tsjlh" value="<%=tsjlh%>" >
        <input name="button" type="button" onClick="window.open('InsertCrm_wxfmx.jsp?tsjlh=<%=tsjlh%>')"  value="录入维修费">
        <input name="button" type="button" onClick="window.open('InsertCrm_wxclfmx.jsp?tsjlh=<%=tsjlh%>')"  value="录入材料费">
        <input name="button" type="button" onClick="window.open('Crm_wxclfmxList.jsp?tsjlh=<%=tsjlh%>')"  value="查看材料费" >
      </div>    </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" bgcolor="#E8E8FF"> 
      <div align="right"><font color="#0000CC">客户编号</font></div>    </td>
    <td width="31%" bgcolor="#E8E8FF"> <%=khbh%> </td>
    <td width="21%" bgcolor="#E8E8FF"> 
      <div align="right"><font color="#0000CC">合同号</font></div>    </td>
    <td width="29%" bgcolor="#E8E8FF"> <%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">客户姓名</font></td>
    <td width="31%" bgcolor="#E8E8FF"> <%=khxm%>（<%=lxfs%>） </td>
    <td width="21%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">签约店面</font></td>
    <td width="29%" bgcolor="#E8E8FF"> <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">房屋地址</font></td>
    <td colspan="3" bgcolor="#E8E8FF"> <%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" bgcolor="#E8E8FF"> 
      <div align="right"><font color="#0000CC">设计师</font></div>    </td>
    <td width="31%" bgcolor="#E8E8FF"> <%=sjs%> </td>
    <td width="21%" bgcolor="#E8E8FF"> 
      <div align="right"><font color="#0000CC">质检员</font></div>    </td>
    <td width="29%" bgcolor="#E8E8FF"> <%=zjxm%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" bgcolor="#E8E8FF"> 
      <div align="right"><font color="#0000CC">施工队</font></div>    </td>
    <td width="31%" bgcolor="#E8E8FF"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
    <td width="21%" bgcolor="#E8E8FF"> 
      <div align="right"><font color="#0000CC">施工班组</font></div>    </td>
    <td width="29%" bgcolor="#E8E8FF"> <%=sgbz%> </td>
  </tr>
  <tr bgcolor="#FFFFCC"> 
    <td width="19%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">实开工日期</font></td>
    <td width="31%" bgcolor="#E8E8FF"> <%=sjkgrq%> </td>
    <td width="21%" align="right" bgcolor="#E8E8FF"><font color="#0000CC">实交工日期</font></td>
    <td width="29%" bgcolor="#E8E8FF"> <%=sjjgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">处理状态</td>
    <td width="31%"><%
	cf.selectToken(out,"0+未受理&1+已受理&2+在处理&3+结案&9+不立案",clzt,true);
%></td>
    <td rowspan="7" align="right">报修内容</td>
    <td rowspan="7"><%=tsnr%> </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">投诉来源</td>
    <td width="31%"><%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm",slfsbm,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right"><font color="#660033">录入部门</font></td>
    <td width="31%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+slbm+"'",slbm,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">严重程度</td>
    <td width="31%"><%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm where yzcdbm='"+yzcdbm+"'",yzcdbm,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">要求解决时间</td>
    <td width="31%"><%=yqjjsj%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">是否需回访</td>
    <td width="31%"><%
	cf.selectToken(out,"Y+需回访&N+不需回访",sfxhf,true);
%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">回访时间</td>
    <td width="31%"><%=hfsj%> </td>
  </tr>
  <tr>
    <td align="right" bgcolor="#E8E8FF"> 维修施工队 </td>
    <td bgcolor="#E8E8FF"><%=wxsgd%></td>
    <td align="right" bgcolor="#E8E8FF">&nbsp;</td>
    <td bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr>
    <td align="right" bgcolor="#E8E8FF">维修人工费</td>
    <td bgcolor="#E8E8FF"><%=wxrgf%></td>
    <td align="right" bgcolor="#E8E8FF">维修车费</td>
    <td bgcolor="#E8E8FF"><%=wxcf%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#E8E8FF">维修材料费</td>
    <td bgcolor="#E8E8FF"><%=wxclf%></td>
    <td align="right" bgcolor="#E8E8FF">维修总费用</td>
    <td bgcolor="#E8E8FF"><%=wxzfy%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#E8E8FF">厂家承担费用</td>
    <td bgcolor="#E8E8FF"><%=cjcdfy%></td>
    <td align="right" bgcolor="#E8E8FF">&nbsp;</td>
    <td bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
  <tr>
    <td align="right" bgcolor="#E8E8FF">施工队承担费用</td>
    <td bgcolor="#E8E8FF"><%=sgdcdfy%></td>
    <td align="right" bgcolor="#E8E8FF">业主承担费用</td>
    <td bgcolor="#E8E8FF"><%=khcdfy%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#E8E8FF">公司承担费用</td>
    <td bgcolor="#E8E8FF"><%=gscdfy%></td>
    <td align="right" bgcolor="#E8E8FF">其它方承担费用</td>
    <td bgcolor="#E8E8FF"><%=qtfcdfy%></td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td width="19%" align="right">备注</td>
    <td colspan="3"> <%=bz%> </td>
  </tr>
</table>

        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF" align="center"> 
            <td width="11%"> 
              <div align="center"><font color="#006666">责任部门</font></div>
            </td>
            <td width="20%"> 
              <div align="center"><font color="#006666">原因</font></div>
            </td>
            <td width="8%"> 
              <div align="center"><font color="#006666">处理状态</font></div>
            </td>
            <td width="46%"> 
              <div align="center"><font color="#006666">处理情况</font></div>
            </td>
            <td width="9%"> 
              <div align="center"><font color="#006666">处理时间</font></div>
            </td>
            <td width="6%"> 
              <div align="center"><font color="#006666">处理人</font></div>
            </td>
          </tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	ls_sql="select dwmc,'（'||tsxlmc||'）'||tsyymc,DECODE(clzt,'1','未处理','2','在处理','3','已解决') clzt,clqk,clsj,clr";
	ls_sql+=" from  crm_tsbm,sq_dwxx,dm_tsxlbm,dm_tsyybm";
	ls_sql+=" where crm_tsbm.dwbh=sq_dwxx.dwbh and tsjlh='"+tsjlh+"'";
	ls_sql+=" and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm and crm_tsbm.tsyybm=dm_tsyybm.tsyybm";
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
        <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
          <tr bgcolor="#FFFFFF" align="center"> 
            <td width="11%"> 
              <div align="center"><font color="#006666">回访时间</font></div>
            </td>
            <td width="62%"> 
              <div align="center"><font color="#006666">客户回访情况</font></div>
            </td>
            <td width="27%"> 
              <div align="center"><font color="#006666">回访中出现的新问题</font></div>
            </td>
          </tr>
          <%
	String khhfqk=null;
	String cxxwt=null;

	ls_sql="select hfsj,khhfqk,cxxwt";
	ls_sql+=" from  crm_tshfjl,crm_tsjlhfmx";
	ls_sql+=" where crm_tshfjl.hfjlh=crm_tsjlhfmx.hfjlh and tsjlh='"+tsjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
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
       </table>


</body>
</html>

<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_lr(FormName)//参数FormName:Form的名称
{
	FormName.action="InsertCrm_wxclfmx.jsp";
	FormName.submit();
	return true;
}
function f_ck(FormName)//参数FormName:Form的名称
{
	FormName.action="Crm_wxclfmxList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
