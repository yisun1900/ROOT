<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String lrbm=(String)session.getAttribute("dwbh");

String khbh=cf.GB2Uni(request.getParameter("khbh"));

String jlh=null;

String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String kgrq=null;
String jgrq=null;
String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String gdjsjd=null;
String bz=null;
String bjjb=null;
String bjjbmc=null;
double clf=0;
double sgebfb=23;
int fwmj=0;
String kgzsm=null;
String kgzbz=null;

double zqgczjf=0;
double zjxje=0;

double cfje=0;
double zccz=0;
double fwmjcz=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select kgzbz,gdjsjd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sgd,sgbz,zjxm,crm_khxx.bz";
	ls_sql+=" ,zqgczjf,zjxje,crm_khxx.bjjb,bjjbmc,clf,sgebfb,kgzsm,fwmj";
	ls_sql+=" from  crm_khxx,sq_dwxx,bdm_bjjbbm";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.bjjb=bdm_bjjbbm.bjjbbm(+) and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		kgzbz=cf.fillNull(rs.getString("kgzbz"));
		zqgczjf=rs.getDouble("zqgczjf");
		zjxje=rs.getDouble("zjxje");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		kgzsm=cf.fillNull(rs.getString("kgzsm"));
		fwmj=rs.getInt("fwmj");

		gdjsjd=cf.fillNull(rs.getString("gdjsjd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));

		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		bz=cf.fillHtml(rs.getString("bz"));

	}
	rs.close();
	ps.close();

	if (kgzbz.equals("Y"))
	{
		out.println("错误！已冲卡");
		return;
	}




	clf=cf.round(clf,0);



	String lx="";
	ls_sql="select lx";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" where bjjbbm='"+bjjb+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lx=rs.getString("lx");
	}
	rs.close();
	ps.close();

	if (lx.equals("2"))//1：非套餐；2：套餐
	{
		ls_sql="select tcsgze ";
		ls_sql+=" from  crm_tckhqye";
		ls_sql+=" where khbh='"+khbh+"'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zqgczjf=rs.getDouble("tcsgze");
		}
		rs.close();
		ps.close();

		ls_sql="SELECT sum(sl*jsj)";
		ls_sql+=" FROM bj_khzcxm";
		ls_sql+=" where bj_khzcxm.khbh='"+khbh+"' and bj_khzcxm.sfcscp='Y'";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			zccz=rs.getDouble(1);
		}
		rs.close();
		ps.close();
	}



	fwmjcz=cf.round(fwmj*0.8,2);

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="、"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	//拆除金额
	ls_sql="SELECT sum(bj_gclmx.sl*bj_bjxmmx.zqdj)";
	ls_sql+=" FROM bj_bjxmmx,bj_gclmx";
	ls_sql+=" where bj_bjxmmx.khbh='"+khbh+"'";
	ls_sql+=" and bj_bjxmmx.khbh=bj_gclmx.khbh and bj_bjxmmx.dqbm=bj_gclmx.dqbm and bj_bjxmmx.xmbh=bj_gclmx.xmbh";
	ls_sql+=" and bj_bjxmmx.xmxlbm in('0101','0601')";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		cfje=rs.getDouble(1);
	}
	rs.close();
	ps.close();
	if (cfje<=400)
	{
		cfje=0;
	}

	cfje=cf.round(cfje,0);


	clf=cf.round((zqgczjf-cfje)*sgebfb/100,2);

	int count=0;
	ls_sql="select NVL(max(substr(jlh,8,2)),0)";
	ls_sql+=" from  cw_cflkjl";
	ls_sql+=" where khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	jlh=khbh+cf.addZero(count+1,2);
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
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

<html>
<head>
<title>辅料卡</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:14">
  <tr>
    <td width="100%"> 
      <div align="center"><strong>冲辅料卡（记录号：<%=jlh%>）</strong>(开工)</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank" >
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">客户编号</font> </td>
              <td><%=khbh%> </td>
              <td align="right"><font color="#0000FF">合同号</font> </td>
              <td><%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">客户姓名</font> </td>
              <td><%=khxm%> </td>
              <td align="right"><font color="#0000FF">质检姓名</font></td>
              <td><%=zjxm%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">房屋地址</font></td>
              <td colspan="3"><%=fwdz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">施工队</font></td>
              <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','（已撤销）','N','')||'（'||dh||'）' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
              <td align="right"><font color="#0000FF">施工班组</font></td>
              <td><%=sgbz%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">设计师</font> </td>
              <td><%=sjs%> </td>
              <td align="right"><font color="#0000FF">签约店面</font> </td>
              <td><%=dwmc%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">签约日期</font></td>
              <td><%=qyrq%> </td>
              <td align="right" bgcolor="#FFFFFF">报价级别</td>
              <td><%=bjjbmc%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">合同开工日期</font></td>
              <td><%=kgrq%> </td>
              <td align="right" bgcolor="#FFFFFF"><font color="#0000FF">合同竣工日期</font></td>
              <td><%=jgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#0000FF">实际开工日期</font></td>
              <td><%=sjkgrq%> </td>
              <td align="right"><font color="#0000FF">实际竣工日期</font></td>
              <td><%=sjjgrq%> </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#FFFFFF"><font color="#0000FF">备注</font></td>
              <td colspan="3" bgcolor="#FFFFFF"> <%=bz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" bgcolor="#CCFFCC"><font color="#0000FF"><span class="STYLE6">预算工料款</span></font></td>
              <td bgcolor="#CCFFCC"><%=zqgczjf%></td>
              <td align="right" bgcolor="#CCFFCC">&nbsp;</td>
              <td bgcolor="#CCFFCC">&nbsp;</td>
            </tr>
           
            <tr>
              <td align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font>材料费百分比</td>
              <td bgcolor="#CCFFCC"><input type="text" name="sgebfb" size="8" maxlength="10"  value="<%=sgebfb%>" onChange="calValue(editform)">
%</td>
              <td align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font><font color="#0000FF">材料费</font></td>
              <td bgcolor="#CCFFCC"><input type="text" name="clf" size="20" maxlength="10"  value="<%=clf%>" readonly></td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font>充值卡号</td>
              <td width="31%" bgcolor="#CCFFCC"> 
                <p>
                  <input name="czkh" type="text" value="" size="20" maxlength="10" >
              </p>              </td>
              <td width="18%" align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font><font color="#0000FF">拆除金额</font></td>
              <td width="33%" bgcolor="#CCFFCC"><input type="text" name="cfje" size="20" maxlength="10"  value="<%=cf.round(cfje,0)%>" readonly></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font><font color="#0000FF">房屋面积</font></td>
              <td bgcolor="#CCFFCC"><input name="fwmj" type="text" value="<%=fwmj%>" size="20" maxlength="10" readonly></td>
              <td align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font><font color="#0000FF">地锢金额</font></td>
              <td bgcolor="#CCFFCC"><input name="fwmjcz" type="text" value="<%=cf.round(fwmjcz,0)%>" size="20" maxlength="10" readonly></td>
            </tr>
            <tr>
              <td align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font><font color="#0000FF">工长套餐主材充值</font></td>
              <td bgcolor="#CCFFCC"><input name="zccz" type="text" value="<%=cf.round(zccz,0)%>" size="20" maxlength="10" readonly></td>
              <td align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font><font color="#0000FF">充值总额</font></td>
              <td bgcolor="#CCFFCC"><input name="czze" type="text" value="<%=cf.round(fwmjcz+clf+zccz,0)%>" size="20" maxlength="10" readonly></td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font>录入时间</td>
              <td width="31%" bgcolor="#CCFFCC"> 
                <input type="text" name="kgzsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">            </td>
              <td width="18%" align="right" bgcolor="#CCFFCC"><font color="#FF0000">*</font><font color="#0000FF">录入人</font></td>
              <td width="33%" bgcolor="#CCFFCC"> 
                <input type="text" name="kgzr" size="20" maxlength="10"  value="<%=yhmc%>" readonly>              </td>
            </tr>
            <tr> 
              <td width="18%" align="right" bgcolor="#CCFFCC">备注</td>
              <td colspan="3" bgcolor="#CCFFCC"> 
                <textarea name="kgzsm" cols="71"  rows="3"><%=kgzsm%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="jlh"  value="<%=jlh%>" >
                  <input type="hidden" name="khbh"  value="<%=khbh%>" >
                  <input type="hidden" name="sgd"  value="<%=sgd%>" >
                  <input type="hidden" name="sgbz"  value="<%=sgbz%>" >
                  <input type="hidden" name="ysglk"  value="<%=zqgczjf%>" >
                  <input type="button"  value="保存" onClick="f_do(editform)">
                  <input type="reset"  value="重输">
				  <input type="button" value="辅料卡打印" onClick="f_do1(editform)" name="flkdy" disabled>
                </div>              </td>
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
function calValue(FormName)
{  
	var clf=<%=(zqgczjf-cfje)%>*FormName.sgebfb.value/100.0;
	FormName.clf.value=round(clf,0);

	var czze=FormName.clf.value*1.0+FormName.fwmjcz.value*1.0+FormName.zccz.value*1.0;
	FormName.czze.value=round(czze,0);
} 
function f_do1(FormName)
{
	FormName.action="/cwgl/flk/flkdy.jsp";
	FormName.submit();
	return false;
}   

function f_do(FormName)//参数FormName:Form的名称
{
	calValue(FormName);

	if(	javaTrim(FormName.sgebfb)=="") {
		alert("请输入[施工额百分比]！");
		FormName.sgebfb.focus();
		return false;
	}
	if(!(isFloat(FormName.sgebfb, "施工额百分比"))) {
		return false;
	}
	if (parseFloat(FormName.sgebfb.value)==0)
	{
		alert("[施工额百分比]不能为0！");
		FormName.sgebfb.select();
		return false;
	}

	if(	javaTrim(FormName.clf)=="") {
		alert("请输入[材料费]！");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "材料费"))) {
		return false;
	}

	if (parseFloat(FormName.clf.value)==0)
	{
		alert("[材料费]不能为0！");
		FormName.clf.select();
		return false;
	}

	if(	javaTrim(FormName.kgzr)=="") {
		alert("请输入[录入人]！");
		FormName.kgzr.focus();
		return false;
	}
	if(	javaTrim(FormName.czkh)=="") {
		alert("请输入[充值卡号]！");
		FormName.czkh.focus();
		return false;
	}
	if(	javaTrim(FormName.kgzsj)=="") {
		alert("请输入[录入时间]！");
		FormName.kgzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.kgzsj, "录入时间"))) {
		return false;
	}

	
	FormName.action="SaveEditCrm_khxx.jsp";  
	FormName.submit();
	FormName.flkdy.disabled=false;
	return true;
}
//-->
</SCRIPT>

