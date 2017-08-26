<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");

String khbh=null;
String khjskze=null;
String khsskze=null;
String sjcb=null;
String sj=null;
String tdjs=null;
String sptdjs=null;
String glftd=null;
String glf=null;
String clf=null;
String zgclf=null;
String jkje=null;
String kwxf=null;
String spgckk=null;
String ksdf=null;
String kqtk=null;
String bz=null;
double tdjsje=0;

String khxm=null;
String fwdz=null;
String lxfs=null;
String sjs=null;
String hth=null;
String qyrq=null;
String kgrq=null;
String sjkgrq=null;
String jgrq=null;
String sjjgrq=null;
String sjwjrq=null;
String dwbh=null;
String sgd=null;
String zjxm=null;
String jzbz=null;
double qye=0;
double wdzgce=0;
double xjqye=0;

double zjxje=0;
double sfke=0;
double zkl=0;
double bk=0;

double hbssk=0;//环保项目实收款
double wxj=0;//维修金
double wxjbfb=0;//维修金

String sjsfy=null;
String sgdfy=null;
String zjfy=null;
String gsfy=null;
String qtfy=null;
String gckk=null;

String spr=null;
String spsj=null;
String spjl=null;
String spyj=null;

String gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select wxjbfb,wxj,spr,spsj,spjl,spyj,khbh,khjskze,khsskze,sjcb,sj,tdjs,glftd,glf,clf,zgclf,jkje,kwxf,ksdf,kqtk,bk,bz,tdjsje,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy ";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		wxjbfb=rs.getDouble("wxjbfb");
		wxj=rs.getDouble("wxj");
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spjl=cf.fillNull(rs.getString("spjl"));
		spyj=cf.fillNull(rs.getString("spyj"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khjskze=cf.fillNull(rs.getString("khjskze"));
		khsskze=cf.fillNull(rs.getString("khsskze"));
		sjcb=cf.fillNull(rs.getString("sjcb"));
		sj=cf.fillNull(rs.getString("sj"));
		tdjs=cf.fillNull(rs.getString("tdjs"));
		glftd=cf.fillNull(rs.getString("glftd"));
		glf=cf.fillNull(rs.getString("glf"));
		clf=cf.fillNull(rs.getString("clf"));
		zgclf=cf.fillNull(rs.getString("zgclf"));
		jkje=cf.fillNull(rs.getString("jkje"));
		kwxf=cf.fillNull(rs.getString("kwxf"));
		ksdf=cf.fillNull(rs.getString("ksdf"));
		kqtk=cf.fillNull(rs.getString("kqtk"));
		bk=rs.getDouble("bk");
		bz=cf.fillNull(rs.getString("bz"));
		tdjsje=rs.getDouble("tdjsje");
		sjsfy=cf.fillNull(rs.getString("sjsfy"));
		sgdfy=cf.fillNull(rs.getString("sgdfy"));
		zjfy=cf.fillNull(rs.getString("zjfy"));
		gsfy=cf.fillNull(rs.getString("gsfy"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		gckk=cf.fillNull(rs.getString("gckk"));
	}
	rs.close();
	ps.close();

	
	ls_sql="select zkl,zjxje,sfke,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,jzbz,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zkl=rs.getDouble("zkl");
		zjxje=rs.getDouble("zjxje");
		sfke=rs.getDouble("sfke");
		qye=rs.getDouble("qye");
		wdzgce=rs.getDouble("wdzgce");

		jzbz=cf.fillNull(rs.getString("jzbz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

	}
	rs.close();
	ps.close();

	if (jzbz.equals(""))
	{
		jzbz="1";
	}


	//环保项目
	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and fklxbm='92' and scbz='N'";//92：环保项目
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hbssk=rs.getDouble(1);//已收环保项目款
	}
	rs.close();
	ps.close();

	ls_sql="select sum(fkje)";
	ls_sql+=" from  cw_khfkjl";
	ls_sql+=" where khbh='"+khbh+"' and zffs='31' and zckx='92' and scbz='N'";//转出环保项目款
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		hbssk=hbssk-rs.getDouble(1);
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
<title>工队结算-审批</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 工队结算-修改审批（结算记录号：<%=gdjsjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveXgSpCw_gdjsjl.jsp" name="editform">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right">客户编号</td>
              <td><%=khbh%></td>
              <td align="right">合同号</td>
              <td><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="right">客户姓名</div>
              </td>
              <td><%=khxm%>（<%=lxfs%>） </td>
              <td> 
                <div align="right">质检姓名</div>
              </td>
              <td><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td> 
                <div align="right">签约店面</div>
              </td>
              <td><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td> 
                <div align="right">设计师</div>
              </td>
              <td><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">签约日期</td>
              <td><%=qyrq%></td>
              <td align="right">实际完结日期</td>
              <td><%=sjwjrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">合同开工日期</td>
              <td><%=kgrq%></td>
              <td align="right">合同竣工日期</td>
              <td><%=jgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right">实际开工日期</td>
              <td><%=sjkgrq%></td>
              <td align="right">实际竣工日期</td>
              <td><%=sjjgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">施工队</font></td>
              <td> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%> 
                </select>
              </td>
              <td align="right"><font color="#0000FF">家装标志</font></td>
              <td> 
                <select name="jzbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+家装&2+公装",jzbz,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">家装签约额</font></td>
              <td> 
                <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right"><font color="#0000FF">未打折工程额</font></td>
              <td> 
                <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">增减项金额</font></td>
              <td> 
                <input type="text" name="zjxje" value="<%=zjxje%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right"><font color="#0000FF">工程实收款总额</font></td>
              <td> 
                <input type="text" name="khsskze" value="<%=sfke%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"></td>
              <td> 
              </td>
              <td align="right"><font color="#0000FF">环保项目实收款</font></td>
              <td> 
                <input type="text" name="hbssk" value="<%=hbssk%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right"><font color="#0000FF">折扣率</font></td>
              <td> 
                <input type="text" name="zkl" value="<%=zkl%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right">&nbsp;</td>
              <td>&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td height="27" colspan="4" align="center" bgcolor="#FFFFCC">审批信息</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="19%">客户结算金额</td>
              <td width="31%"> 
                <input type="text" name="khjskze" value="<%=khjskze%>" size="20" maxlength="17" onChange="f_jsglf(editform)">
              </td>
              <td align="right" width="18%">实际成本</td>
              <td width="32%"> 
                <input type="text" name="sjcb" size="20" maxlength="17"  value="<%=sjcb%>" onChange="f_jsglf(editform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">提点基数</div>
              </td>
              <td width="31%"> 
                <select name="tdjs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_jsglf(editform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+客户结算金额&2+实收款&3+签约额&4+实际成本&9+其它",tdjs);
%> 
                </select>
              </td>
              <td width="18%"> 
                <div align="right">提点基数金额</div>
              </td>
              <td width="32%"> 
                <input type="text" name="tdjsje" size="20" maxlength="17"  value="<%=tdjsje%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">设计师承担费用</div>
              </td>
              <td width="31%"> 
                <input type="text" name="sjsfy" size="20" maxlength="17"  value="<%=sjsfy%>" onChange="f_gckk(editform)">
              </td>
              <td width="18%"> 
                <div align="right">施工队承担费用</div>
              </td>
              <td width="32%"> 
                <input type="text" name="sgdfy" size="20" maxlength="17"  value="<%=sgdfy%>" onChange="f_gckk(editform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">质检承担费用</div>
              </td>
              <td width="31%"> 
                <input type="text" name="zjfy" size="20" maxlength="17"  value="<%=zjfy%>" onChange="f_gckk(editform)">
              </td>
              <td width="18%"> 
                <div align="right">公司承担费用</div>
              </td>
              <td width="32%"> 
                <input type="text" name="gsfy" size="20" maxlength="17"  value="<%=gsfy%>" onChange="f_gckk(editform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="19%"> 
                <div align="right">其它方承担费用</div>
              </td>
              <td width="31%"> 
                <input type="text" name="qtfy" size="20" maxlength="17"  value="<%=qtfy%>" onChange="f_gckk(editform)">
              </td>
              <td width="18%"> 
                <div align="right">工程扣款</div>
              </td>
              <td width="32%"> 
                <input type="text" name="gckk" value="<%=gckk%>" size="20" maxlength="17" onChange="f_gckk(editform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF">备注</td>
              <td colspan="3" bgcolor="#E8E8FF"><%=bz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC">管理费提点</td>
              <td bgcolor="#FFFFCC"> 
                <input type="text" name="glftd" size="10" maxlength="17"  value="<%=glftd%>" >
                % </td>
              <td align="right" bgcolor="#FFFFCC">补款</td>
              <td bgcolor="#FFFFCC"> 
                <input type="text" name="bk" size="20" maxlength="17"  value="<%=bk%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC">维修金百分比</td>
              <td bgcolor="#FFFFCC"> 
                <input name="wxjbfb" type="text" onChange="f_wxj(editform)"  value="<%=wxjbfb%>" size="10" maxlength="17">
                % </td>
              <td align="right" bgcolor="#FFFFCC">维修金</td>
              <td bgcolor="#FFFFCC"> 
                <input type="text" name="wxj" size="20" maxlength="17"  value="<%=wxj%>" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC">审批结论</td>
              <td bgcolor="#FFFFCC"> 
<%
	cf.radioToken(out, "spjl","3+同意&4+不同意",spjl);
%>
              </td>
              <td bgcolor="#FFFFCC">&nbsp;</td>
              <td bgcolor="#FFFFCC">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td bgcolor="#FFFFCC"> 
                <div align="right">审批人</div>
              </td>
              <td bgcolor="#FFFFCC"> 
                <input type="text" name="spr" size="20" maxlength="20"  value="<%=spr%>" readonly>
              </td>
              <td bgcolor="#FFFFCC"> 
                <div align="right">审批时间</div>
              </td>
              <td bgcolor="#FFFFCC"> 
                <input type="text" name="spsj" size="20" maxlength="10"  value="<%=spsj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC">审批意见</td>
              <td colspan="3" bgcolor="#FFFFCC"> 
                <textarea name="spyj" cols="71" rows="3"><%=spyj%></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" > 
                <div align="center"> 
                    <input type="hidden" name="gdjsjlh"  value="<%=gdjsjlh%>" >
                    <input type="button"  value="保存" onClick="f_do(editform)">
                    <input type="reset"  value="重输">
                    <input name="button3" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="客户收款信息">
                    <input name="button" type="button" onClick="window.open('dejs.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>')" value="定额结算">
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
function f_jsglf(FormName)//参数FormName:Form的名称
{
	if (FormName.tdjs.value=='1')//1：客户结算金额；2：实收款；3：签约额； 4：实际成本；5：工程量；9：其它
	{
		FormName.tdjsje.value=FormName.khjskze.value;
	}
	else if (FormName.tdjs.value=='2')
	{
		FormName.tdjsje.value=<%=(sfke)%>;
	}
	else if (FormName.tdjs.value=='3')
	{
		FormName.tdjsje.value=<%=(qye)%>;
	}
	else if (FormName.tdjs.value=='4')
	{
		FormName.tdjsje.value=FormName.sjcb.value;
	}
	else if (FormName.tdjs.value=='9')
	{
	}

	FormName.wxj.value=round(FormName.tdjsje.value*FormName.wxjbfb.value/100.0,2);
}

function f_gckk(FormName)//参数FormName:Form的名称
{
	var gk=FormName.sjsfy.value*1.0+FormName.sgdfy.value*1.0+FormName.zjfy.value*1.0+FormName.gsfy.value*1.0+FormName.qtfy.value*1.0;
	gk=parseInt(gk*100.0+0.5)/100.0;
	FormName.gckk.value=gk;
}

function f_wxj(FormName)//参数FormName:Form的名称
{
	FormName.wxj.value=round(FormName.tdjsje.value*FormName.wxjbfb.value/100.0,2);
}
function f_do(FormName)//参数FormName:Form的名称
{
//	f_jsglf(FormName);


	if(	javaTrim(FormName.sgd)=="") {
		alert("请选择[施工队]！");
		FormName.sgd.focus();
		return false;
	}
	if(	javaTrim(FormName.jzbz)=="") {
		alert("请选择[家装标志]！");
		FormName.jzbz.focus();
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[工程签约额]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "工程签约额"))) {
		return false;
	}
	if(	javaTrim(FormName.wdzgce)=="") {
		alert("请输入[未打折工程额]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "未打折工程额"))) {
		return false;
	}
	if(	javaTrim(FormName.zjxje)=="") {
		alert("请输入[增减项金额]！");
		FormName.zjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zjxje, "增减项金额"))) {
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("请输入[折扣率]！");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "折扣率"))) {
		return false;
	}
	if(	javaTrim(FormName.khjskze)=="") {
		alert("请输入[客户结算金额]！");
		FormName.khjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khjskze, "客户结算金额"))) {
		return false;
	}

	if(	javaTrim(FormName.khsskze)=="") {
		alert("请输入[客户实收款总额]！");
		FormName.khsskze.focus();
		return false;
	}
	if(!(isFloat(FormName.khsskze, "客户实收款总额"))) {
		return false;
	}
	if(	javaTrim(FormName.hbssk)=="") {
		alert("请输入[环保项目实收款]！");
		FormName.hbssk.focus();
		return false;
	}
	if(!(isFloat(FormName.hbssk, "环保项目实收款"))) {
		return false;
	}
	if(	javaTrim(FormName.tdjs)=="") {
		alert("请选择[提点基数]！");
		FormName.tdjs.focus();
		return false;
	}
	if(	javaTrim(FormName.tdjsje)=="") {
		alert("请输入[提点基数金额]！");
		FormName.tdjsje.focus();
		return false;
	}
	if(!(isFloat(FormName.tdjsje, "提点基数金额"))) {
		return false;
	}

	if(!(isFloat(FormName.sjcb, "实际成本"))) {
		return false;
	}

	if(	javaTrim(FormName.gckk)=="") {
		alert("请输入[工程扣款]！");
		FormName.gckk.focus();
		return false;
	}
	if(!(isFloat(FormName.gckk, "工程扣款"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsfy)=="") {
		alert("请输入[设计师承担费用]！");
		FormName.sjsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfy, "设计师承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.sgdfy)=="") {
		alert("请输入[施工队承担费用]！");
		FormName.sgdfy.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfy, "施工队承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.zjfy)=="") {
		alert("请输入[质检承担费用]！");
		FormName.zjfy.focus();
		return false;
	}
	if(!(isFloat(FormName.zjfy, "质检承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.gsfy)=="") {
		alert("请输入[公司承担费用]！");
		FormName.gsfy.focus();
		return false;
	}
	if(!(isFloat(FormName.gsfy, "公司承担费用"))) {
		return false;
	}
	if(	javaTrim(FormName.qtfy)=="") {
		alert("请输入[其它方承担费用]！");
		FormName.qtfy.focus();
		return false;
	}
	if(!(isFloat(FormName.qtfy, "其它方承担费用"))) {
		return false;
	}

	if(	javaTrim(FormName.glftd)=="") {
		alert("请输入[管理费提点]！");
		FormName.glftd.focus();
		return false;
	}
	if(!(isFloat(FormName.glftd, "管理费提点"))) {
		return false;
	}

	if(	javaTrim(FormName.wxjbfb)=="") {
		alert("请输入[维修金百分比]！");
		FormName.wxjbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.wxjbfb, "维修金百分比"))) {
		return false;
	}

	if(	javaTrim(FormName.wxj)=="") {
		alert("请输入[维修金]！");
		FormName.wxj.focus();
		return false;
	}
	if(!(isFloat(FormName.wxj, "维修金"))) {
		return false;
	}
	if(	javaTrim(FormName.bk)=="") {
		alert("请输入[补款]！");
		FormName.bk.focus();
		return false;
	}
	if(!(isFloat(FormName.bk, "补款"))) {
		return false;
	}

	if(	!radioChecked(FormName.spjl)) {
		alert("请选择[审批结论]！");
		FormName.spjl[0].focus();
		return false;
	}
	if(	javaTrim(FormName.spr)=="") {
		alert("请输入[审批人]！");
		FormName.spr.focus();
		return false;
	}
	if(	javaTrim(FormName.spsj)=="") {
		alert("请输入[审批时间]！");
		FormName.spsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.spsj, "审批时间"))) {
		return false;
	}

	FormName.submit();
	return true;
}

//-->
</SCRIPT>
