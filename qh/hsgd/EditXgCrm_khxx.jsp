<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String hth=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;
String dwbh=null;
String lrsj=null;
String pdsj=null;
String pdr=null;
String sgd=null;
String sfxhf=null;
String hfrq=null;
String hflxbm=null;
String hdbz=null;
String khlxbm=null;
String pmjj=null;
double qye=0;
String ybjbh=null;
String sgbz=null;
String cqbm=null;
String sjs=null;
String bz=null;
String pdsm=null;
String zjxm=null;
String jlbz=null;
String kgzbz=null;
String jzbz=null;

String cgdz=null;
String hdr=null;

String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));

String ybjfwdz="";
String ybjsjs="";
String ybjsgd="";
String ybjsgbz="";
String ybjzjxm="";

String ybjssmc=null;
String hdsfssmc=null;
String ybjss=null;
String hdsfss=null;
String ssfgs=null;

String deflbm=null;
String deflmc=null;
int kpjlh=0;

Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select sgdkpjlh,DECODE(jzbz,'1','家装工程','2','公装工程') jzbz,DECODE(NVL(kgzbz,'N'),'Y','已出开工证','N','未出开工证') kgzbz,hth,jlbz,zjxm,pdsm,cgdz,hdr,sjs,cqbm,sgbz,pmjj,qye,ybjbh,khbh,khxm,fwdz,lxfs,qyrq,jyjdrq,kgrq,jgrq,dwbh,lrsj,pdsj,pdr,sgd,sfxhf,hfrq,hflxbm,hdbz,khlxbm,bz,DECODE(ybjss,'0','未核实','Y','属实','N','不属实') ybjssmc,ybjss,DECODE(hdsfss,'0','未核实','Y','属实','N','不属实') hdsfssmc,hdsfss ";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		kpjlh=rs.getInt("sgdkpjlh");
		jzbz=cf.fillNull(rs.getString("jzbz"));
		kgzbz=cf.fillNull(rs.getString("kgzbz"));
		hth=cf.fillNull(rs.getString("hth"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		pdsm=cf.fillNull(rs.getString("pdsm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		sjs=cf.fillNull(rs.getString("sjs"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		pmjj=cf.fillNull(rs.getString("pmjj"));
		qye=rs.getDouble("qye");
		ybjbh=cf.fillNull(rs.getString("ybjbh"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		pdr=cf.fillNull(rs.getString("pdr"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hflxbm=cf.fillNull(rs.getString("hflxbm"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));
		ybjss=cf.fillNull(rs.getString("ybjss"));
		hdsfss=cf.fillNull(rs.getString("hdsfss"));
		ybjssmc=cf.fillNull(rs.getString("ybjssmc"));
		hdsfssmc=cf.fillNull(rs.getString("hdsfssmc"));
	}
	rs.close();

	ls_sql="select fwdz,sjs,sq_sgd.sgdmc||'（'||sq_sgd.sgd||'）' sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_sgd";
	ls_sql+=" where  khbh='"+ybjbh+"' and crm_khxx.sgd=sq_sgd.sgd(+)";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ybjfwdz=cf.fillNull(rs.getString("fwdz"));
		ybjsjs=cf.fillNull(rs.getString("sjs"));
		ybjsgd=cf.fillNull(rs.getString("sgd"));
		ybjsgbz=cf.fillNull(rs.getString("sgbz"));
		ybjzjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();


	ls_sql="select ssfgs";
	ls_sql+=" from  sq_dwxx ";
	ls_sql+=" where  dwbh='"+dwbh+"' ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();

	//大单
	ls_sql=" select deflbm,deflmc";
	ls_sql+=" from  crm_khxx,kp_deflbm";
	ls_sql+=" where  (khbh='"+wherekhbh+"')  ";
	ls_sql+=" and qye>=dedy and qye<dexy";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		deflbm=rs.getString("deflbm");
		deflmc=rs.getString("deflmc");
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

String str1=cf.getItemData("select bzmc,bzmc||'（'||sq_bzxx.dh||'）',sq_bzxx.sgd from sq_bzxx,sq_sgd where sq_bzxx.sgd=sq_sgd.sgd and sq_sgd.ssfgs='"+ssfgs+"' order by sq_bzxx.sgd,sq_bzxx.bzmc ");

%>

<html>
<head>
<title>派单</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">
        换施工队
        <BR><b><font color="#FF0000">注意：【换施工队】是不计算【已接单数】的，【拒绝接单】一定不能在此操作</font></b>
		<BR>
      </div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"> <%=khbh%> 
                <input type="hidden" name="khbh" size="20" maxlength="7"  value="<%=khbh%>" >
                </font></td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right">合同号</div>
              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"><%=hth%> 
                </font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right"><font color="#000099">客户姓名</font></td>
              <td width="31%" bgcolor="#FFFFFF"><font color="#000000"><%=khxm%>（<%=lxfs%>）</font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">设计师</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=sjs%>（<%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%>） </font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right"><font color="#0000CC">城区</font></td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"> <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm order by cqbm",cqbm,true);
%> </font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#000099">每平米均价</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#000000"><%=pmjj%> 
                </font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF" align="right"><font color="#000099">房屋地址</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><font color="#000000"><%=fwdz%></font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#0000CC">签约日期</font></div>
              </td>
              <td width="31%" bgcolor="#FFFFFF"> <font color="#000000"> <%=qyrq%> 
                </font></td>
              <td width="18%" bgcolor="#FFFFFF"> 
                <div align="right"><font color="#000099">录入时间</font></div>
              </td>
              <td width="32%" bgcolor="#FFFFFF"> <font color="#000000"><%=lrsj%> 
                </font></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">备注</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><%=bz%></td>
            </tr>
            <%
	if (!ybjbh.equals(""))
	{
%> 
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">参观样板间编号</font></td>
              <td width="31%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjbh%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">样板间地址</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjfwdz%></font></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">设计师</font></td>
              <td width="31%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsjs%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">质检姓名</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjzjxm%></font></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#FF00FF">施工队</font></td>
              <td width="31%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsgd%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#FF00FF">施工班组</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#FF00FF"><%=ybjsgbz%></font></td>
            </tr>
            <%
	}
	if (!hdbz.equals("1")){
%> 
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#0000CC">回单标志</font></td>
              <td width="31%" bgcolor="#FFFFFF"><font color="#000000"><%
	cf.selectToken(out,"1+非回单&2+设计师回单&3+施工队回单&4+老客户回单&5+员工回单&6+班长回单&7+售楼处&8+材料商&9+其他",hdbz,false);
%></font></td>
              <td width="18%" bgcolor="#FFFFFF" align="right"><font color="#660066">回单人</font></td>
              <td width="32%" bgcolor="#FFFFFF"><font color="#660066"><%=hdr%></font></td>
            </tr>
            <tr> 
              <td width="19%" align="right" bgcolor="#FFFFFF"><font color="#660066">回单装修地址</font></td>
              <td colspan="3" bgcolor="#FFFFFF"><font color="#660066"><%=cgdz%></font></td>
            </tr>
            <%
	}
%> 
            <tr bgcolor="#CCCCFF"> 
              <td width="19%" align="right">样板间是否属实</td>
              <td width="31%"><font color="#660066"><%=ybjssmc%></font></td>
              <td width="18%" align="right">回单是否属实</td>
              <td width="32%"><font color="#660066"><%=hdsfssmc%></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="19%" align="right"><font color="#000000"><b>大小单</b></font></td>
              <td width="31%"><font color="#000000"><b><%=deflmc%>（<%=jzbz%>）</b></font></td>
              <td width="18%" align="right"><font color="#000000"><b>工程签约额</b></font></td>
              <td width="32%" bgcolor="#FFCCCC"><font color="#000000"><b><%=qye%></b></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="19%" align="right"><b>客户类型</b></td>
              <td width="31%"><font color="#000000"><%
	cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm,true);
%></font></td>
              <td width="18%" align="right"><b>建议交底日期</b></td>
              <td width="32%"><font color="#000000"><%=jyjdrq%></font></td>
            </tr>
            <tr bgcolor="#FFCCCC"> 
              <td width="19%" align="right"><b>合同开工日期</b></td>
              <td width="31%"><font color="#000000"><%=kgrq%></font></td>
              <td width="18%" align="right"><b>合同竣工日期</b></td>
              <td width="32%"><font color="#000000"><%=jgrq%></font></td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFCC"> 
                <div align="right">派单类型</div>
              </td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <select name="jlbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectToken(out,"0+正常派单&5+大单抵小单&6+小单抵大单&1+回单奖励&2+公司奖励&3+设计师指定派单&4+客户指定派单",jlbz,false);
%> 
                </select>
              </td>
              <td width="18%" bgcolor="#FFFFCC"> 
                <div align="right">出开工证标志</div>
              </td>
              <td width="32%" bgcolor="#FFFFCC"><%=kgzbz%> </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFCC"> 
                <div align="right">派单人</div>
              </td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <input type="text" name="pdr" size="20" maxlength="20"  value="<%=yhmc%>" readonly>
              </td>
              <td width="18%" bgcolor="#FFFFCC"> 
                <div align="right">派单时间</div>
              </td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <input type="text" name="pdsj" size="20" maxlength="10"  value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFCC" align="right">目前施工队</td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <select name="oldsgd" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(sgd,sgbz,<%=str1%>)">
                  <%
	String sql="";

	sql="select sq_sgd.sgd,sgdmc||'（队号：'||sq_sgd.duihao||'）'";
	sql+=" from sq_sgd";
	sql+=" where ssfgs='"+ssfgs+"' and cxbz='N'";
	sql+=" order by sgdmc";

	cf.selectItem(out,sql,sgd,false);
%> 
                </select>
              </td>
              <td width="18%" bgcolor="#FFFFCC" align="right">质检</td>
              <td width="32%" bgcolor="#FFFFCC"> 
                <select name="zjxm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select yhmc,yhmc||'（'||dh||'）' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='05' order by yhmc",zjxm,false);
%> 
                </select>
              </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFCC" align="right">新施工队</td>
              <td width="31%" bgcolor="#FFFFCC"> 
                <select name="newsgd" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="selectItem(sgd,sgbz,<%=str1%>)">
                  <option value=""></option>
                  <%
	sql="select sq_sgd.sgd,sgdmc||'（队号：'||sq_sgd.duihao||'）'";
	sql+=" from sq_sgd";
	sql+=" where ssfgs='"+ssfgs+"' and cxbz='N' and (tdbz='N' or (tdbz='Y' and tdzzsj<SYSDATE))";
	sql+=" order by sgdmc";

	cf.selectItem(out,sql,"");
%> 
                </select>
              </td>
              <td width="18%" bgcolor="#FFFFCC" align="right">&nbsp;</td>
              <td width="32%" bgcolor="#FFFFCC">&nbsp; </td>
            </tr>
            <tr> 
              <td width="19%" bgcolor="#FFFFFF"> 
                <div align="right">换施工队说明</div>
              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="hsgdsm" cols="71" rows="3"><%=pdsm%></textarea>
              </td>
            </tr>
            <input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
            <tr align="center"> 
              <td colspan="4" height="2"> 
                <input type="hidden"  name="kpjlh" value="<%=kpjlh%>">
                <input type="button"  value="保存" onClick="f_do(editform)">
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
	if(	javaTrim(FormName.newsgd)=="") {
		alert("请输入[新施工队]！");
		FormName.newsgd.focus();
		return false;
	}

	FormName.action="SaveEditXgCrm_khxx.jsp";
//	FormName.target="";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>

