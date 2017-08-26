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
String tdjs=null;
String sptdjs=null;
String spgckk=null;
String bz=null;
double tdjsje=0;
double glftd=0;

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
String zjxxh=null;

double zhzjxje=0;
double zjxje=0;
double sfke=0;
double zkl=0;
double bk=0;

double hbssk=0;//环保项目实收款

String sjsfy=null;
double sgdfy=0;
String zjfy=null;
String gsfy=null;
String qtfy=null;
String gckk=null;

String spr=null;
String spsj=null;
String spjl=null;
String spyj=null;

double dejsje=0;

String jsfs=null;
double sgdfk=0;
double sjsfk=0;
double xbclk=0;
String jsr=null;
String jssj=null;


double glf=0;
double clf=0;//物流材料费
double zgclf=0;//自购材料费
double sj=0;
double ksdf=0;
double gdjskze=0;

double wxj=0;//维修金
double wxjbfb=0;//维修金
double kwxf=0;
double jkje=0;
double fakuan=0;
double kqtk=0;//其它扣款
double sqgz=0;

String cwjsr=null;
String cwjssj=null;
String cwjssm=null;

String gdjsjlh=cf.GB2Uni(request.getParameter("gdjsjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select jsfs,sgdfk,sjsfk,xbclk,jsr,jssj,dejsje,spr,spsj,spjl,spyj,khbh,sgd,khjskze,khsskze,sjcb,tdjs,glftd,ksdf,bk,bz,tdjsje,gckk,sjsfy,sgdfy,zjfy,gsfy,qtfy ";
	ls_sql+=" ,glf,sj,clf,zgclf,gdjskze   ,wxjbfb,wxj,kwxf,jkje,fakuan,kqtk,sqgz,cwjsr,cwjssj,cwjssm";
	ls_sql+=" from  cw_gdjsjl";
	ls_sql+=" where  (gdjsjlh='"+gdjsjlh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{

		glf=rs.getDouble("glf");
		sj=rs.getDouble("sj");
		clf=rs.getDouble("clf");
		zgclf=rs.getDouble("zgclf");
		gdjskze=rs.getDouble("gdjskze");

		wxjbfb=rs.getDouble("wxjbfb");
		wxj=rs.getDouble("wxj");
		kwxf=rs.getDouble("kwxf");
		jkje=rs.getDouble("jkje");
		fakuan=rs.getDouble("fakuan");
		kqtk=rs.getDouble("kqtk");
		sqgz=rs.getDouble("sqgz");

		cwjsr=cf.fillNull(rs.getString("cwjsr"));
		cwjssj=cf.fillNull(rs.getDate("cwjssj"));
		cwjssm=cf.fillNull(rs.getString("cwjssm"));
		
		
		jsfs=cf.fillNull(rs.getString("jsfs"));
		sgdfk=rs.getDouble("sgdfk");
		sjsfk=rs.getDouble("sjsfk");
		xbclk=rs.getDouble("xbclk");
		jsr=cf.fillNull(rs.getString("jsr"));
		jssj=cf.fillNull(rs.getDate("jssj"));
		sgd=cf.fillNull(rs.getString("sgd"));

		
		dejsje=rs.getDouble("dejsje");
		spr=cf.fillNull(rs.getString("spr"));
		spsj=cf.fillNull(rs.getDate("spsj"));
		spjl=cf.fillNull(rs.getString("spjl"));
		spyj=cf.fillNull(rs.getString("spyj"));
		khbh=cf.fillNull(rs.getString("khbh"));
		khjskze=cf.fillNull(rs.getString("khjskze"));
		khsskze=cf.fillNull(rs.getString("khsskze"));
		sjcb=cf.fillNull(rs.getString("sjcb"));
		tdjs=cf.fillNull(rs.getString("tdjs"));
		glftd=rs.getDouble("glftd");
		ksdf=rs.getDouble("ksdf");
		bk=rs.getDouble("bk");
		bz=cf.fillNull(rs.getString("bz"));
		tdjsje=rs.getDouble("tdjsje");
		sjsfy=cf.fillNull(rs.getString("sjsfy"));
		sgdfy=rs.getDouble("sgdfy");
		zjfy=cf.fillNull(rs.getString("zjfy"));
		gsfy=cf.fillNull(rs.getString("gsfy"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		gckk=cf.fillNull(rs.getString("gckk"));
	}
	rs.close();
	ps.close();

	
	ls_sql="select zjxxh,zkl,zhzjxje,zjxje,sfke,khxm,fwdz,lxfs,sjs,hth,qyrq,dwbh,zjxm,wdzgce,qye,jzbz,kgrq,sjkgrq,jgrq,sjjgrq,sjwjrq";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+khbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		zjxxh=cf.fillNull(rs.getString("zjxxh"));
		zkl=rs.getDouble("zkl");
		zhzjxje=rs.getDouble("zhzjxje");
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
		zjxm=cf.fillNull(rs.getString("zjxm"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

	}
	rs.close();
	ps.close();




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

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center">施工队结算--<strong>财务结算</strong> （结算记录号：<%=gdjsjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">
<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">客户编号</td>
              <td width="30%"><%=khbh%></td>
              <td align="right" width="21%">合同号</td>
              <td width="29%"><%=hth%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right">客户姓名</div>
              </td>
              <td width="30%"><%=khxm%> </td>
              <td width="21%"> 
                <div align="right">质检姓名</div>
              </td>
              <td width="29%"><%=zjxm%> </td>
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
              <td width="21%"> 
                <div align="right">设计师</div>
              </td>
              <td width="29%"><%=sjs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">签约日期</td>
              <td width="30%"><%=qyrq%></td>
              <td align="right" width="21%">实际完结日期</td>
              <td width="29%"><%=sjwjrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">合同开工日期</td>
              <td width="30%"><%=kgrq%></td>
              <td align="right" width="21%">合同竣工日期</td>
              <td width="29%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">实际开工日期</td>
              <td width="30%"><%=sjkgrq%></td>
              <td align="right" width="21%">实际竣工日期</td>
              <td width="29%"><%=sjjgrq%></td>
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
              <td align="right" width="21%"><font color="#0000FF">家装标志</font></td>
              <td width="29%"> 
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
              <td align="right" width="21%"><font color="#0000FF">工程原报价</font></td>
              <td width="29%"> 
                <input type="text" name="wdzgce" value="<%=wdzgce%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">折后累计增减项</font></td>
              <td width="30%"> 
                <input type="text" name="zhzjxje" value="<%=zhzjxje%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%"><font color="#0000FF">折前累计增减项</font></td>
              <td width="29%"><%=zjxje %></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">工程实际发生额</font></td>
              <td width="30%"> <%=(qye+zhzjxje  )%>（<font color="#0000FF">签约额</font>＋<font color="#0000FF">折后增减项</font>）</td>
              <td align="right" width="21%"><font color="#0000FF">工程实收款总额</font></td>
              <td width="29%"> 
                <input type="text" name="khsskze" value="<%=sfke%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">折扣率</font></td>
              <td width="30%"> 
                <input type="text" name="zkl" value="<%=zkl%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%">&nbsp;</td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td height="2" colspan="4" align="center">结算信息</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">结算方式</td>
              <td width="30%"><%
	cf.radioToken(out, "jsfs","1+计提管理费&2+定额结算",jsfs,true);
%></td>
              <td align="right" width="21%">客户结算金额</td>
              <td width="29%"> 
                <input type="text" name="khjskze" value="<%=khjskze%>" size="20" maxlength="17" onChange="f_jsglf(editform)" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%"> 
                <div align="right">提点基数</div>
              </td>
              <td width="30%"> 
                <select name="tdjs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="f_jsglf(editform)">
                  <%
	cf.selectToken(out,"1+客户结算金额&2+实收款&3+签约额&4+实际成本&9+其它",tdjs,false);
%> 
                </select>
              </td>
              <td width="21%"> 
                <div align="right">提点基数金额</div>
              </td>
              <td width="29%"> 
                <input type="text" name="tdjsje" size="20" maxlength="17"  value="<%=tdjsje%>" onChange="f_jsk(insertform)" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="4"></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%" align="right">施工队承担工程扣款</td>
              <td width="30%"> 
                <input type="text" name="sgdfy" size="20" maxlength="17"  value="<%=sgdfy%>" readonly>
              </td>
              <td width="21%" align="right">设计师承担工程扣款</td>
              <td width="29%"> 
                <input type="text" name="sjsfy" size="20" maxlength="17"  value="<%=sjsfy%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%"> 
                <div align="right">质检承担工程扣款</div>
              </td>
              <td width="30%"> 
                <input type="text" name="zjfy" size="20" maxlength="17"  value="<%=zjfy%>" readonly>
              </td>
              <td width="21%"> 
                <div align="right">公司承担工程扣款</div>
              </td>
              <td width="29%"> 
                <input type="text" name="gsfy" size="20" maxlength="17"  value="<%=gsfy%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="20%"> 
                <div align="right">其它方承担工程扣款</div>
              </td>
              <td width="30%"> 
                <input type="text" name="qtfy" size="20" maxlength="17"  value="<%=qtfy%>" readonly>
              </td>
              <td width="21%"> 
                <div align="right">工程扣款</div>
              </td>
              <td width="29%"> 
                <input type="text" name="gckk" value="<%=gckk%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="4"></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">施工队罚款</td>
              <td width="30%"> 
                <input type="text" name="sgdfk" value="<%=sgdfk%>" size="20" maxlength="17" readonly>
              </td>
              <td align="right" width="21%">设计师罚款</td>
              <td width="29%"> 
                <input type="text" name="sjsfk" value="<%=sjsfk%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">定额结算金额</td>
              <td width="30%"> 
                <input type="text" name="dejsje" value="<%=dejsje%>" size="20" maxlength="17" readonly>
              </td>
              <td width="21%" align="right">需补材料款</td>
              <td width="29%"> 
                <input type="text" name="xbclk" value="<%=xbclk%>" size="20" maxlength="17" readonly>
              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td align="right" width="20%">结算人</td>
              <td width="30%"><%=jsr%></td>
              <td width="21%" align="right">结算时间</td>
              <td width="29%"><%=jssj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#E8E8FF" width="20%">备注</td>
              <td colspan="3" bgcolor="#E8E8FF"><%=bz%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td height="2" colspan="4" align="center" bgcolor="#FFFFCC">审批信息</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">管理费提点</td>
              <td bgcolor="#FFFFCC" width="30%"> 
                <input type="text" name="glftd" size="10" maxlength="17"  value="<%=glftd%>" onChange="f_jsk(insertform)" readonly>
                % </td>
              <td align="right" bgcolor="#FFFFCC" width="21%">管理费</td>
              <td bgcolor="#FFFFCC" width="29%"> 
                <input type="text" name="glf" size="20" maxlength="17"  value="<%=glf%>" onChange="f_jsk(insertform)" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">审批结论</td>
              <td bgcolor="#FFFFCC" width="30%"> <%
	cf.radioToken(out, "spjl","3+同意&4+不同意",spjl,true);
%> </td>
              <td bgcolor="#FFFFCC" width="21%" align="right">补款</td>
              <td bgcolor="#FFFFCC" width="29%"> 
                <input type="text" name="bk" size="20" maxlength="17"  value="<%=bk%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td bgcolor="#FFFFCC" width="20%"> 
                <div align="right">审批人</div>
              </td>
              <td bgcolor="#FFFFCC" width="30%"> <%=spr%> </td>
              <td bgcolor="#FFFFCC" width="21%"> 
                <div align="right">审批时间</div>
              </td>
              <td bgcolor="#FFFFCC" width="29%"> <%=spsj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" bgcolor="#FFFFCC" width="20%">审批意见</td>
              <td colspan="3" bgcolor="#FFFFCC"> <%=spyj%> </td>
            </tr>
            <tr bgcolor="#FFFFFF" align="center"> 
              <td colspan="4">财务结算 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">物流材料费</td>
              <td width="30%" bgcolor="#FFFFFF"> 
                <input type="text" name="clf" value="<%=clf%>" size="20" maxlength="9" onchange="f_gdjskze(insertform)">
              </td>
              <td align="right" width="21%">自购材料费</td>
              <td width="29%"> 
                <input name="zgclf" type="text" id="zgclf" value="<%=zgclf%>" size="20" maxlength="9" onchange="f_gdjskze(insertform)" >
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">税金</td>
              <td width="30%"> 
                <input type="text" name="sj" value="<%=sj%>" size="20" maxlength="17" onChange="f_jsk(insertform)">
              </td>
              <td align="right" width="21%">扣水电费</td>
              <td width="29%"> 
                <input name="ksdf" type="text" id="ksdf" value="<%=ksdf%>" size="20" maxlength="17" onchange="f_gdjskze(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><b><font color="#FF0000">*</font><font color="#0000FF">工队结算款总额</font></b></td>
              <td width="30%"> 
                <input type="text" name="gdjskze" value="<%=gdjskze%>" size="20" maxlength="9" readonly>
              </td>
              <td align="right" width="21%">&nbsp;</td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td colspan="4"> <b>计提管理费</b>：<font color="#0000FF">结算款</font>＝提点基数－管理费－税金－材料费－自购材料费－工程扣款－扣水电费＋补款－施工队罚款 
                <br>
                <b>定 额结 算</b>：<font color="#0000FF">结算款</font>＝&nbsp;&nbsp;&nbsp;&nbsp;定额结算金额－税金－材料费－自购材料费－工程扣款－扣水电费＋补款－施工队罚款 
                －需补材料款 </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%"><font color="#0000FF">维修金百分比</font></td>
              <td width="30%"> 
                <input name="wxjbfb" type="text" onChange="f_wxj(editform)"  value="<%=wxjbfb%>" size="10" maxlength="17" readonly>
                % </td>
              <td align="right" width="21%"><font color="#0000FF">维修金</font></td>
              <td width="29%"> 
                <input type="text" name="wxj" size="20" maxlength="17"  value="<%=wxj%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">扣维修费</td>
              <td width="30%"> 
                <input type="text" name="kwxf" value="<%=kwxf%>" size="20" maxlength="17" onchange="f_sqgz(insertform)">
              </td>
              <td align="right" width="21%">借款金额</td>
              <td width="29%"> 
                <input type="text" name="jkje" value="<%=jkje%>" size="20" maxlength="17" onchange="f_sqgz(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td align="right" width="20%">罚款金额</td>
              <td width="30%"> 
                <input type="text" name="fakuan" value="<%=fakuan%>" size="20" maxlength="17" onchange="f_sqgz(insertform)">
              </td>
              <td align="right" width="21%">其它扣款</td>
              <td width="29%"> 
                <input type="text" name="kqtk" value="<%=kqtk%>" size="20" maxlength="17" onchange="f_sqgz(insertform)">
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right"><b><font color="#FF0000">*</font><font color="#0000FF">税前工资</font></b></td>
              <td width="30%"> 
                <input type="text" name="sqgz" value="<%=sqgz%>" size="20" maxlength="9" readonly>
              </td>
              <td width="21%">&nbsp;</td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%">&nbsp;</td>
              <td colspan="3"><font color="#0000FF">税前工资</font> = 工队结算款总额－维修金-扣维修费－借款－罚款金额－其它扣款</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%"> 
                <div align="right"><font color="#0000FF">财务结算人</font></div>
              </td>
              <td width="30%"> 
                <input type="text" name="cwjsr" value="<%=cwjsr%>" size="20" maxlength="20" readonly>
              </td>
              <td width="21%"> 
                <div align="right"><font color="#0000FF">财务结算时间</font></div>
              </td>
              <td width="29%"> 
                <input type="text" name="cwjssj" value="<%=cwjssj%>" size="20" maxlength="10" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="20%" align="right">财务结算说明</td>
              <td colspan="3"> 
                <textarea name="cwjssm" cols="71" rows="3"><%=cwjssm%></textarea>
              </td>
            </tr>
            <tr align="center"> 
              <td colspan="4"> 
                <p> 
                  <input type="button"  value="结算" onClick="f_do(insertform)">
                  <input type="button" value="查看结算信息" onClick="window.open('/cwgl/sgdjs/ViewCw_gdjsjl.jsp?gdjsjlh=<%=gdjsjlh%>')" name="ck" >
                  <input type="button" value="打印定额结算单(队长)" onClick="window.open('DySgdCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                  <input type="button" value="打印定额结算单(内部)" onClick="window.open('DyGSCw_dejsmx.jsp?gdjsjlh=<%=gdjsjlh%>&zjxxh=<%=zjxxh%>')">
                  <input type="reset"  value="重输" name="reset">
                  <input type="hidden" name="khbh" value="<%=khbh%>" >
                  <input type="hidden" name="gdjsjlh" value="<%=gdjsjlh%>" >
                    <input type="hidden" name="hbssk" value="<%=hbssk%>" size="20" maxlength="17" readonly>
                    <input type="hidden" name="sjcb" value="<%=sjcb%>" size="20" maxlength="17" onChange="f_jsglf(insertform)">
                </p>
                <p> 
                  <input name="button2" type="button" onClick="window.open('/khxx/ViewCwxx.jsp?khbh=<%=khbh%>')" value="客户付款信息">
                  <input type="button" onClick="window.open('/cwgl/sgdjs/JsWxjlList.jsp?sgd=<%=sgd%>&gdjsjlh=<%=gdjsjlh%>')" value="维修费">
                  <input type="button" onClick="window.open('/cwgl/sgdjs/JsJkjlList.jsp?sgd=<%=sgd%>&gdjsjlh=<%=gdjsjlh%>')" value="借款记录" name="button">
                  <input type="button" onClick="window.open('/cwgl/sgdjs/JsFkjlList.jsp?sgd=<%=sgd%>&gdjsjlh=<%=gdjsjlh%>')" value="罚款">
                  <input type="button" onClick="window.open('/cwgl/sgdjs/JsKqtkList.jsp?sgd=<%=sgd%>&gdjsjlh=<%=gdjsjlh%>')" value="其它扣款">
                </p>
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
function f_jsk(FormName)//参数FormName:Form的名称
{
	<%
	if (jzbz.equals("1"))
	{
		%>
		//家装管理费＝（提点基数－税金）×管理费提点
		FormName.glf.value=round(  (FormName.tdjsje.value*1.0-FormName.sj.value*1.0)*FormName.glftd.value/100.0  ,2);
		<%
	}
	else{
		%>
		//公装管理费＝提点基数×管理费提点
		FormName.glf.value=round(  (FormName.tdjsje.value*1.0)*FormName.glftd.value/100.0  ,2);
		<%
	}
	%>

	f_gdjskze(FormName);
}
function f_gdjskze(FormName)//参数FormName:Form的名称
{
	//计提管理费：结算款＝提点基数－管理费－税金－材料费－自购材料费－工程扣款－扣水电费＋补款－施工队罚款 
	//定 额结 算：结算款＝   定额结算金额－税金－材料费－自购材料费－工程扣款－扣水电费＋补款－施工队罚款 －需补材料款 

	var gdjskze=0;
	if ("<%=jsfs%>"=="1")//1：计提管理费；2：定额结算
	{
		gdjskze=FormName.tdjsje.value*1.0-FormName.glf.value*1.0-FormName.sj.value*1.0-FormName.clf.value*1.0-FormName.zgclf.value*1.0-FormName.sgdfy.value*1.0-FormName.ksdf.value*1.0+FormName.bk.value*1.0-FormName.sgdfk.value*1.0;
	}
	else{
		gdjskze=FormName.dejsje.value*1.0-FormName.sj.value*1.0-FormName.clf.value*1.0-FormName.zgclf.value*1.0-FormName.sgdfy.value*1.0-FormName.ksdf.value*1.0+FormName.bk.value*1.0-FormName.sgdfk.value*1.0-FormName.xbclk.value*1.0;
	}

	gdjskze=round(gdjskze,2);

	FormName.gdjskze.value=gdjskze;

	f_sqgz(FormName);

}

function f_sqgz(FormName)//参数FormName:Form的名称
{
	//税前工资 = 工队结算款总额－维修金-扣维修费－借款－罚款金额－其它扣款

	var sqgz=0;
	sqgz=FormName.gdjskze.value*1.0-FormName.wxj.value*1.0-FormName.kwxf.value*1.0-FormName.jkje.value*1.0-FormName.fakuan.value*1.0-FormName.kqtk.value*1.0;

	sqgz=round(sqgz,2);

	FormName.sqgz.value=sqgz;

}

function f_do(FormName)//参数FormName:Form的名称
{
	f_jsk(FormName);

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
		alert("请输入[增减项金额]！");
		FormName.zhzjxje.focus();
		return false;
	}
	if(!(isFloat(FormName.zhzjxje, "增减项金额"))) {
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

	if ("<%=jsfs%>"=="1")//1：计提管理费；2：定额结算
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
		if(	javaTrim(FormName.glftd)=="") {
			alert("请输入[管理费提点]！");
			FormName.glftd.focus();
			return false;
		}
		if(!(isFloat(FormName.glftd, "管理费提点"))) {
			return false;
		}
		if(	javaTrim(FormName.glf)=="") {
			alert("请输入[管理费]！");
			FormName.glf.focus();
			return false;
		}
		if(!(isFloat(FormName.glf, "管理费"))) {
			return false;
		}
	}
	

	if(	javaTrim(FormName.gckk)=="") {
		alert("请输入[工程扣款]！");
		FormName.gckk.focus();
		return false;
	}
	if(!(isFloat(FormName.gckk, "工程扣款"))) {
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

	if(!(isFloat(FormName.sjcb, "实际成本"))) {
		return false;
	}

	if(	javaTrim(FormName.gdjskze)=="") {
		alert("请输入[工队结算款总额]！");
		FormName.gdjskze.focus();
		return false;
	}
	if(!(isFloat(FormName.gdjskze, "工队结算款总额"))) {
		return false;
	}


	if(	javaTrim(FormName.clf)=="") {
		alert("请输入[物流材料费]！");
		FormName.clf.focus();
		return false;
	}
	if(!(isFloat(FormName.clf, "物流材料费"))) {
		return false;
	}
	if(	javaTrim(FormName.zgclf)=="") {
		alert("请输入[自购材料费]！");
		FormName.zgclf.focus();
		return false;
	}
	if(!(isFloat(FormName.zgclf, "自购材料费"))) {
		return false;
	}

	if(	javaTrim(FormName.sj)=="") {
		alert("请输入[税金]！");
		FormName.sj.focus();
		return false;
	}
	if(!(isFloat(FormName.sj, "税金"))) {
		return false;
	}
	if(	javaTrim(FormName.ksdf)=="") {
		alert("请输入[扣水电费]！");
		FormName.ksdf.focus();
		return false;
	}
	if(!(isFloat(FormName.ksdf, "扣水电费"))) {
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
	if(	javaTrim(FormName.kwxf)=="") {
		alert("请输入[扣维修费]！");
		FormName.kwxf.focus();
		return false;
	}
	if(!(isFloat(FormName.kwxf, "扣维修费"))) {
		return false;
	}

	if(	javaTrim(FormName.jkje)=="") {
		alert("请输入[借款金额]！");
		FormName.jkje.focus();
		return false;
	}
	if(!(isFloat(FormName.jkje, "借款金额"))) {
		return false;
	}
	if(	javaTrim(FormName.fakuan)=="") {
		alert("请输入[罚款金额]！");
		FormName.fakuan.focus();
		return false;
	}
	if(!(isFloat(FormName.fakuan, "罚款金额"))) {
		return false;
	}
	if(	javaTrim(FormName.kqtk)=="") {
		alert("请输入[其它扣款]！");
		FormName.kqtk.focus();
		return false;
	}
	if(!(isFloat(FormName.kqtk, "其它扣款"))) {
		return false;
	}


	if(	javaTrim(FormName.sqgz)=="") {
		alert("请输入[税前工资]！");
		FormName.sqgz.focus();
		return false;
	}
	if(!(isFloat(FormName.sqgz, "税前工资"))) {
		return false;
	}


	if(	javaTrim(FormName.cwjsr)=="") {
		alert("请输入[财务结算人]！");
		FormName.cwjsr.focus();
		return false;
	}
	if(	javaTrim(FormName.cwjssj)=="") {
		alert("请输入[财务结算时间]！");
		FormName.cwjssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.cwjssj, "财务结算时间"))) {
		return false;
	}

	FormName.action="SaveEditCwjsCw_gdjsjl.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>

