<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String khjskze=null;
String khsskze=null;
String sjcb=null;
String sj=null;
String tdjs=null;
String glftd=null;
String glf=null;
String wxj=null;
String clf=null;
String zgclf=null;
String jkje=null;
String fakuan=null;
String kwxf=null;
String ksdf=null;
String kqtk=null;
String bk=null;
String bz=null;
String tdjsje=null;
String jsfs=null;
double sgdfk =0;
double sjsfk =0;
double dejsje =0;
double xbclk =0;

String spjl=null;
String spyj=null;
String spr=null;
String spsj=null;

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
String zjxxh=null;
double qye=0;
double wdzgce=0;

double zjxje =0;
double zhzjxje =0;
double sfke=0;
double zkl=0;

double hbssk=0;//环保项目实收款

String sjsfy=null;
String sgdfy=null;
String zjfy=null;
String gsfy=null;
String qtfy=null;
String gckk=null;

String kbxbz=null;
String bxkssj=null;
String bxjzsj=null;
String bybxsm=null;

int row=0;
String bgcolor=null;


String gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jsfs,sjsfk,dejsje,xbclk,sgdfk,khbh,khjskze,khsskze,sjcb,sj,tdjs,glftd,glf,wxj,clf,zgclf,jkje,fakuan,kwxf,ksdf,kqtk,bk,bz,tdjsje,spjl,spyj,spr,spsj,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy ";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		jsfs=cf.fillNull(rs.getString("jsfs"));
		sjsfk=rs.getDouble("sjsfk");
		sgdfk=rs.getDouble("sgdfk");
		dejsje=rs.getDouble("dejsje");
		xbclk=rs.getDouble("xbclk");
		khbh=cf.fillNull(rs.getString("khbh"));
		khjskze=cf.fillNull(rs.getString("khjskze"));
		khsskze=cf.fillNull(rs.getString("khsskze"));
		sjcb=cf.fillNull(rs.getString("sjcb"));
		sj=cf.fillNull(rs.getString("sj"));
		tdjs=cf.fillNull(rs.getString("tdjs"));
		glftd=cf.fillNull(rs.getString("glftd"));
		glf=cf.fillNull(rs.getString("glf"));
		wxj=cf.fillNull(rs.getString("wxj"));
		clf=cf.fillNull(rs.getString("clf"));
		zgclf=cf.fillNull(rs.getString("zgclf"));
		jkje=cf.fillNull(rs.getString("jkje"));
		fakuan=cf.fillNull(rs.getString("fakuan"));
		kwxf=cf.fillNull(rs.getString("kwxf"));
		ksdf=cf.fillNull(rs.getString("ksdf"));
		kqtk=cf.fillNull(rs.getString("kqtk"));
		bk=cf.fillNull(rs.getString("bk"));
		bz=cf.fillNull(rs.getString("bz"));
		tdjsje=cf.fillNull(rs.getString("tdjsje"));
		spjl=cf.fillNull(rs.getString("spjl"));
		spyj=cf.fillNull(rs.getString("spyj"));
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		sjsfy=cf.fillNull(rs.getString("sjsfy"));
		sgdfy=cf.fillNull(rs.getString("sgdfy"));
		zjfy=cf.fillNull(rs.getString("zjfy"));
		gsfy=cf.fillNull(rs.getString("gsfy"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		gckk=cf.fillNull(rs.getString("gckk"));
	}
	rs.close();
	ps.close();

	ls_sql="select zjxxh,zkl,sfke,zhzjxje,zjxje,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,sgd,zjxm,wdzgce,qye,jzbz,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq,kbxbz,bxkssj,bxjzsj,bybxsm";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		zkl=rs.getDouble("zkl");
		sfke=rs.getDouble("sfke");
		zhzjxje=rs.getDouble("zhzjxje");
		zjxje=rs.getDouble("zjxje");
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

		kbxbz=cf.fillNull(rs.getString("kbxbz"));
		bxkssj=cf.fillNull(rs.getDate("bxkssj"));
		bxjzsj=cf.fillNull(rs.getDate("bxjzsj"));
		bybxsm=cf.fillNull(rs.getString("bybxsm"));

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

%>

<html>
<head>
<title>修改信息</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.STYLE1 {color: #0000FF}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> 请修改施工队结算（结算记录号：<%=gdjsjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="SaveEditCw_gdjsjl.jsp" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">客户编号</td>
              <td width="30%"><%=khbh%></td>
              <td align="right" width="22%">合同号</td>
              <td width="28%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="30%"><%=khxm%>（<%=lxfs%>） </td>
              <td width="22%"> 
                <div align="right">质检姓名</div>
              </td>
              <td width="28%"><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">房屋地址</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">签约店面</div>
              </td>
              <td width="30%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%> </td>
              <td width="22%"> 
                <div align="right">设计师</div>
              </td>
              <td width="28%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">签约日期</td>
              <td width="30%"><%=qyrq%></td>
              <td align="right" width="22%">实际完结日期</td>
              <td width="28%"><%=sjwjrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">合同开工日期</td>
              <td width="30%"><%=kgrq%></td>
              <td align="right" width="22%">合同竣工日期</td>
              <td width="28%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">实际开工日期</td>
              <td width="30%"><%=sjkgrq%></td>
              <td align="right" width="22%">实际竣工日期</td>
              <td width="28%"><%=sjjgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">施工队</font></td>
              <td width="30%"> 
                <select name="sgd" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'","");
%> 
                </select>
              </td>
              <td align="right" width="22%"><font color="#0000FF">家装标志</font></td>
              <td width="28%"> 
                <select name="jzbz" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <%
	cf.selectToken(out,"1+家装&2+公装",jzbz,false);
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">家装签约额</font></td>
              <td width="30%"> 
                <input type="text" name="qye" value="<%=qye%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="22%"><font color="#0000FF">工程原报价</font></td>
              <td width="28%"> 
                <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">折后累计增减项</font></td>
              <td width="30%"> 
                <input type="text" name="zhzjxje" value="<%=zhzjxje%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="22%"><font color="#0000FF">折前累计增减项</font></td>
              <td width="28%"> <%=zjxje %></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">工程实际发生额</font></td>
              <td width="30%"><%=(qye+zhzjxje)%>（<font color="#0000FF">签约额</font>＋<font color="#0000FF">折后增减项</font>） 
              </td>
              <td align="right" width="22%"><font color="#0000FF">工程实收款总额</font></td>
              <td width="28%"> 
                <input type="text" name="khsskze" value="<%=sfke%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#FF0000">*</font>结算方式</td>
              <td width="30%"> <%
	cf.radioToken(out, "jsfs","1+计提管理费&2+定额结算",jsfs);
%> </td>
              <td align="right" width="22%">客户结算金额</td>
              <td width="28%"> 
                <input type="text" name="khjskze" value="<%=khjskze%>" size="20" maxlength="17" onChange="f_jsglf(editform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">提点基数</td>
              <td width="30%"> 
                <select name="tdjs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_jsglf(editform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"1+客户结算金额&2+实收款&3+签约额&4+实际成本&9+其它",tdjs);
%> 
                </select>
              </td>
              <td align="right" width="22%">提点基数金额</td>
              <td width="28%"> 
                <input type="text" name="tdjsje" size="20" maxlength="17"  value="<%=tdjsje%>" >
              </td>
            </tr>
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">施工队承担工程扣款</td>
              <td width="30%"> 
                <input type="text" name="sgdfy" size="20" maxlength="17"  value="<%=sgdfy%>" onChange="f_gckk(editform)">
              </td>
              <td width="22%" align="right">设计师承担工程扣款</td>
              <td width="28%"> 
                <input type="text" name="sjsfy" size="20" maxlength="17"  value="<%=sjsfy%>" onChange="f_gckk(editform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">质检承担工程扣款</div>
              </td>
              <td width="30%"> 
                <input type="text" name="zjfy" size="20" maxlength="17"  value="<%=zjfy%>" onChange="f_gckk(editform)">
              </td>
              <td width="22%"> 
                <div align="right">公司承担工程扣款</div>
              </td>
              <td width="28%"> 
                <input type="text" name="gsfy" size="20" maxlength="17"  value="<%=gsfy%>" onChange="f_gckk(editform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">其它方承担工程扣款</div>
              </td>
              <td width="30%"> 
                <input type="text" name="qtfy" size="20" maxlength="17"  value="<%=qtfy%>" onChange="f_gckk(editform)">
              </td>
              <td width="22%"> 
                <div align="right"><font color="#0000CC">工程扣款</font></div>
              </td>
              <td width="28%"> 
                <input type="text" name="gckk" value="<%=gckk%>" size="20" maxlength="17" onChange="f_gckk(editform)" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">施工队罚款</td>
              <td width="30%"> 
                <input type="text" name="sgdfk" value="<%=sgdfk%>" size="20" maxlength="17" >
              </td>
              <td align="right" width="22%">设计师罚款</td>
              <td width="28%"> 
                <input type="text" name="sjsfk" value="<%=sjsfk%>" size="20" maxlength="17" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right" width="20%"><font color="#0000CC">定额结算金额</font></td>
              <td width="30%"><%=dejsje%></td>
              <td width="22%" align="right"><font color="#0000CC">需补材料款</font></td>
              <td width="28%"><%=xbclk%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">审批结论</td>
              <td width="30%"><%
	cf.radioToken(out, "spjl","3+同意&4+不同意",spjl,true);
%> </td>
              <td width="22%" align="right"><font color="#0000FF">折扣率</font></td>
              <td width="28%"> 
                <input type="text" name="zkl" value="<%=zkl%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">审批人</div>
              </td>
              <td width="30%"><%=spr%></td>
              <td width="22%"> 
                <div align="right">审批时间</div>
              </td>
              <td width="28%"><%=spsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">审批意见</td>
              <td colspan="3"><%=spyj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="71" rows="3"><%=bz%></textarea>
              </td>
            </tr>
          </table>

		  
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#999999" align="center"> 
              <td colspan="4">请确认保修信息</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%"> 
                <div align="right">可保修标志</div>
              </td>
              <td colspan="3"> <%
	cf.radioToken(out, "kbxbz","Y+保修&M+部分保修&N+不保修",kbxbz);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">保修开始时间</td>
              <td width="33%"> 
                <input type="text" name="bxkssj" value="<%=bxkssj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
              <td width="19%" align="right">保修截止时间</td>
              <td width="31%"> 
                <input type="text" name="bxjzsj" value="<%=bxjzsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">保修说明</td>
              <td colspan="3"> 
                <textarea name="bybxsm" cols="71" rows="3"><%=bybxsm%></textarea>
              </td>
            </tr>
          </table>
  
  <table border="1" cellspacing="0" cellpadding="1" width="100%" style='FONT-SIZE: 12px'>
    <tr bgcolor="#CCCCCC"  align="center"> 
      <td width="6%">选择保修项目</td>
	<td width="35%">项目名称（<font color="#FF0000"><b>打勾代表保修，不打勾不保修</b></font>）</td>
      <td width="59%">情况说明</td>
    </tr>
<%
	String bxxm=null;
	String xmsm=null;

	ls_sql="SELECT bxxm,xmsm";
	ls_sql+=" FROM crm_bxxmbm";
	ls_sql+=" order by xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bxxm=rs.getString("bxxm");
		xmsm=rs.getString("xmsm");

		String sfbx="";
		String qksm="";
		String mark="";
		ls_sql="SELECT sfbx,qksm";
		ls_sql+=" FROM crm_khbxxm";
		ls_sql+=" where khbh='"+khbh+"' and bxxm='"+bxxm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			sfbx=rs1.getString("sfbx");
			qksm=cf.fillNull(rs1.getString("qksm"));
		}
		rs1.close();
		ps1.close();

		if (sfbx.equals(""))
		{
			mark="checked";
		}
		else if (sfbx.equals("Y"))
		{
			mark="checked";
		}
		else{
			mark="";
		}

		row++;

		if (row%2==0)
		{
			bgcolor="#E8E8FF";
		}
		else{
			bgcolor="#FFFFFF";
		}

		%> 
		<tr bgcolor="<%=bgcolor%>"  align="center"> 
		  <td>
			<input name="xzbxxm" type="checkbox" value="<%=bxxm%>" <%=mark%>>
		  </td>
		  <td><%=bxxm%>
			<input type="hidden" name="bxxm" value="<%=bxxm%>">
		</td>
		  <td>
			<input type="text" name="qksm" value="<%=qksm%>" size="56" maxlength="200" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">
		</td>
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
		if (rs1 != null) rs1.close(); 
		if (ps1 != null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
          </table>
		  
		  
		  
		  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td colspan="4" > 
                <div align="center"> 
                  <p> 
                    <input type="hidden" name="gdjsjlh"  value="<%=gdjsjlh%>" >
                    <input type="hidden" name="khbh"  value="<%=khbh%>" >
                    <input type="hidden" name="hbssk" value="<%=hbssk%>" size="20" maxlength="17" readonly>
                    <input type="hidden" name="sjcb" value="<%=sjcb%>" size="20" maxlength="17" onChange="f_jsglf(insertform)">
                    <input type="button"  value="保存" onClick="f_do(editform)">
                    <input type="reset"  value="重输">
                    <input name="button3" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="客户收款信息">
                  <input name="clzdyxm" type="button" onClick="window.open('ClZdyXm.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')" value="调整工料分析">
                  <input name="dejs" type="button" onClick="window.open('dejs.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')" value="定额结算">
                  <input type="button" value="重建工料分析" onClick="window.open('UpdateGlfx.jsp?khbh=<%=khbh%>&gdjsjlh=<%=gdjsjlh%>')">
                  </p>
                  <p> 
                    <input name="ckjs" type="button" value="查看定额结算结果" onClick="window.open('ViewCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                    <input type="button" value="打印定额结算单(队长)" onClick="window.open('DySgdCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                    <input type="button" value="打印定额结算单(内部)" onClick="window.open('DyGSCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                  </p>
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
		FormName.tdjsje.value=<%=qye%>;
	}
	else if (FormName.tdjs.value=='4')
	{
		FormName.tdjsje.value=FormName.sjcb.value;
	}
	else if (FormName.tdjs.value=='9')
	{
	}

}


function f_gckk(FormName)//参数FormName:Form的名称
{
	var gk=FormName.sjsfy.value*1.0+FormName.sgdfy.value*1.0+FormName.zjfy.value*1.0+FormName.gsfy.value*1.0+FormName.qtfy.value*1.0;
	gk=parseInt(gk*100.0+0.5)/100.0;
	FormName.gckk.value=gk;
}

function f_do(FormName)//参数FormName:Form的名称
{
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
		alert("请输入[工程原报价]！");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "工程原报价"))) {
		return false;
	}
	if(	javaTrim(FormName.zhzjxje)=="") {
		alert("请输入[折后累计增减项]！");
		FormName.zhzjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zhzjxje, "折后累计增减项"))) {
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

	if(	!radioChecked(FormName.jsfs)) {
		alert("请选择[结算方式]！");
		FormName.jsfs[0].focus();
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

	if (FormName.jsfs[0].checked)
	{
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
	if(	javaTrim(FormName.sgdfk)=="") {
		alert("请输入[施工队罚款]！");
		FormName.sgdfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdfk, "施工队罚款"))) {
		return false;
	}
	if(	javaTrim(FormName.sjsfk)=="") {
		alert("请输入[设计师罚款]！");
		FormName.sjsfk.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfk, "设计师罚款"))) {
		return false;
	}


	if(	!radioChecked(FormName.kbxbz)) {
		alert("请选择[可保修标志]！");
		FormName.kbxbz[0].focus();
		return false;
	}

	if (FormName.kbxbz[0].checked || FormName.kbxbz[1].checked)
	{
		if(	javaTrim(FormName.bxkssj)=="") {
			alert("请输入[保修开始时间]！");
			FormName.bxkssj.focus();
			return false;
		}
		if(!(isDatetime(FormName.bxkssj, "保修开始时间"))) {
			return false;
		}
		if(	javaTrim(FormName.bxjzsj)=="") {
			alert("请输入[保修截止时间]！");
			FormName.bxjzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.bxjzsj, "保修截止时间"))) {
			return false;
		}

		var choo=0;

		var i = 0;
		if (<%=row%>==1){
			if( FormName.xzbxxm.checked ){
				choo=1;
			}
		} 
		else{ 
			for (i=0;i <<%=row%>;i++ ){
				if( FormName.xzbxxm[i].checked ){
					choo=1;
				}
			} 
		} 
		if (choo == 0){
			alert("请选择【保修项目】");
			return false;
		}
	
	}
	else{
		FormName.bxkssj.value="";
		FormName.bxjzsj.value="";

		if(	javaTrim(FormName.bybxsm)=="") {
			alert("请选择[保修说明]！");
			FormName.bybxsm.focus();
			return false;
		}
	}


	FormName.submit();
	return true;
}

//-->
</SCRIPT>
