<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String khbh=request.getParameter("khbh");

String yhmc=(String)session.getAttribute("yhmc");
String zdyhbz=(String)session.getAttribute("zdyhbz");

String ssfgs=null;
String dqbm=null;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String zxdm="";
String khxm="";
String xb="";
String cqbm="";
String rddqbm="";
String hxwzbm="";
String fwdz="";
String lxfs="";
String sjs="";

String cxhdbm="";
String nlqjbm="";
String zybm="";
String ysrbm="";
String fjfwbm="";
String xqbm="";
String khlxbm="";
String hxbm="";
String fwmj="";
String fgyqbm="";
String bjjb="";
String ywy="";
String hdbz="";
String cgdz="";
String hdr="";
String jzbz="";
String louhao="";
String shbz="";
double lrsjts=0;


double wdzgce=0;
double qye=0;
double sjf=0;
double glf=0;
double zqguanlif=0;
double guanlif=0;
double suijinbfb=0;
double zqsuijin=0;
double suijin=0;

double spzkl=0;
String sfpzqtyh="";
String pzqtyhnr="";

String hth="";
String sfjczjz="";
String zklx="";
String cxhdbmxq=null;
String cxhdbmzh=null;
String qtdh=null;
String email=null;


try {
	conn=cf.getConnection();


	ls_sql="select qtdh,email,cxhdbmxq,cxhdbmzh,dzbjjc,zxkhlrjc,zklx,sfjczjz,spzkl,sfpzqtyh,pzqtyhnr,cxhdbm,shbz,SYSDATE-lrsj lrsjts,louhao,rddqbm,hxwzbm,ysrbm,zxdm,jzbz,ywy,khxm,xb,cqbm,fwdz,lxfs,sjs,nlqjbm,zybm,fjfwbm,xqbm,khlxbm,hxbm,fwmj,fgyqbm,bjjb,hdbz,cgdz,hdr,ssfgs";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where khbh='"+khbh+"'";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));

		zklx=cf.fillNull(rs.getString("zklx"));
		sfjczjz=cf.fillNull(rs.getString("sfjczjz"));
		spzkl=rs.getDouble("spzkl");
		sfpzqtyh=cf.fillNull(rs.getString("sfpzqtyh"));
		pzqtyhnr=cf.fillNull(rs.getString("pzqtyhnr"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		shbz=cf.fillNull(rs.getString("shbz"));
		lrsjts=rs.getDouble("lrsjts");
		louhao=cf.fillNull(rs.getString("louhao"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		ywy=cf.fillNull(rs.getString("ywy"));
		khxm=rs.getString("khxm");
		xb=cf.fillNull(rs.getString("xb"));
		cqbm=cf.fillNull(rs.getString("cqbm"));
		fwdz=rs.getString("fwdz");
		lxfs=rs.getString("lxfs");
		sjs=cf.fillNull(rs.getString("sjs"));
		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fjfwbm=cf.fillNull(rs.getString("fjfwbm"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		khlxbm=rs.getString("khlxbm");
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=rs.getString("fwmj");
		fgyqbm=rs.getString("fgyqbm");
		bjjb=cf.fillNull(rs.getString("bjjb"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
	}
	rs.close();
	ps.close();

	ls_sql="SELECT dqbm";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("����ʧ��,��������: " + e);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>
<body bgcolor="#CCCCFF"  style="FONT-SIZE:14">

<form method="post" action="" name="insertform" target='_blank'>
          
  <div align="center">��¼ǩ����Ϣ��<font color="#FF0033">*</font>Ϊ�����ֶΣ����ͻ���ţ�<%=khbh%>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��ͬ��</td>
      <td width="34%"> 
        <input type="text" name="hth" value="<%=hth%>" size="20" maxlength="20" onKeyUp="keyTo(khlxbm)">
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>��ϵ�ͻ�</td>
      <td width="31%"> 
        <select name="khlxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(khxm)">
          <%
	if (zdyhbz.equals("Y"))
	{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select khlxbm,khlxmc from dm_khlxbm order by khlxbm",khlxbm);
	}
	else{
		out.println("<option value=\"04\">��ͨ�ͻ�</option>");
	}
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#FF0033">*</font>�ͻ�����</div>
      </td>
      <td width="34%"> 
        <input type="hidden" name="khbh" value="<%=khbh%>" >
        <input type="text" name="khxm" value="<%=khxm%>" size="20" maxlength="50">
      </td>
      <td width="19%"> 
        <div align="right"><font color="#FF0033">*</font>�Ա�</div>
      </td>
      <td width="31%"> 
        <input type="radio" name="xb"  value="M" <% if (xb.equals("M")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        �� 
        <input type="radio" name="xb"  value="W" <% if (xb.equals("W")) out.print("checked");%> onKeyUp="keyGo(lxfs)">
        Ů </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�ֻ�</td>
      <td colspan="3"> 
        <input type="text" name="lxfs" value="<%=lxfs%>" size="40" maxlength="50">
        <font color="#FF0000">���ڽ��ն��ţ����¼һ��,�ж���绰<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�</font></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�����绰</td>
      <td colspan="3"> 
        <input type="text" name="qtdh" value="<%=qtdh%>" size="40" maxlength="50">
        <font color="#FF0000">(ע�⣺�ж���绰<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�)</font> 
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�����ʼ�</td>
      <td width="34%"> 
        <input type="text" name="email" value="<%=email%>" size="30" maxlength="50">
      </td>
      <td width="19%" align="right">ҵ�����֤����</td>
      <td width="31%"> 
        <input type="text" name="sfzhm" value="" size="20" maxlength="18" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��������</td>
      <td width="34%"> 
        <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(xqbm)"  onChange="cf_fwdz(insertform)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where dqbm='"+dqbm+"' order by cqbm",cqbm);
%> 
        </select>
      </td>
      <td width="19%" align="right"><font color="#CC0000">*</font>С��/�ֵ�</td>
      <td width="31%"> 
        <input type="text" name="xqbm" value="<%=xqbm%>" size="20" maxlength="50" onKeyUp="keyTo(rddqbm)"  onChange="cf_fwdz(insertform)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#CC0000">*</font>¥��/���ƺ�</td>
      <td width="34%"> 
        <input type="text" name="louhao" value="<%=louhao%>" size="20" maxlength="50" onKeyUp="keyTo(fwdz)"  onChange="cf_fwdz(insertform)">
      </td>
      <td colspan="2">ע�⣺<font color="#0000FF">���ݵ�ַ</font>��������С����¥�ţ��Զ����ɣ�����¼��</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#FF0033">*</font><font color="#0000FF">���ݵ�ַ</font></div>
      </td>
      <td colspan="3"> 
        <input type="text" name="fwdz" value="<%=fwdz%>" size="72" maxlength="100"  onKeyUp="keyTo(cqbm)" readonly>
      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�����ȵ����</td>
      <td width="34%"> 
        <select name="rddqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(hxwzbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select rddqbm,rddq from dm_rddqbm where dqbm='"+dqbm+"' order by rddqbm",rddqbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">��������λ��</td>
      <td width="31%"> 
        <select name="hxwzbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(nlqjbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hxwzbm,hxwz from dm_hxwzbm where dqbm='"+dqbm+"' order by hxwzbm",hxwzbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">��������</td>
      <td width="34%"> 
        <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(zybm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">ְҵ</td>
      <td width="31%"> 
        <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(ysrbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">������</td>
      <td width="34%"> 
        <select name="ysrbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(fjfwbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysrbm,ysrmc from dm_ysrbm order by ysrbm",ysrbm);
%> 
        </select>
      </td>
      <td width="19%" align="right">����</td>
      <td width="31%"> 
        <select name="fjfwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fjfwbm,fjfwmc from dm_fjfwbm order by fjfwbm",fjfwbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#FF0033">*</font>���ʦ</div>
      </td>
      <td width="34%">
        <select name="sjs" style="FONT-SIZE:12PX;WIDTH:152PX"  >
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx where (sq_yhxx.dwbh='"+zxdm+"' or sq_yhxx.jzbm='"+zxdm+"') and sfzszg in('Y','N') and zwbm='04' order by yhmc",sjs);
%> 
        </select>
      </td>
      <td width="19%"> 
        <div align="right">ҵ��Ա</div>
      </td>
      <td width="31%">
        <select name="ywy" style="FONT-SIZE:12PX;WIDTH:152PX"  >
          <%
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select yhmc,yhmc||'��'||dh||'��' from sq_yhxx,sq_dwxx where sq_yhxx.dwbh=sq_dwxx.dwbh and sfzszg in('Y','N') and sq_dwxx.ssfgs='"+ssfgs+"' and zwbm='19' order by yhmc",ywy);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#FF0033">*</font>�������</div>
      </td>
      <td width="34%"> 
        <input type="text" name="fwmj" value="<%=fwmj%>" size="20" maxlength="20"  onChange="calValue(insertform)" onKeyUp="keyGo(bjjb[0])">
        <input type="hidden" name="pmjj" value="" >
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>���ۼ���</td>
      <td width="31%"><%
	if (bjjb.equals(""))
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm order by bjjbbm","bjjb","");
	}
	else 
	{
		cf.radioItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where bjjbbm='"+bjjb+"'","bjjb",bjjb);
	}

%></td>
    </tr>
	</TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">

    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ����Ż�</td>
      <td width="34%"> <%
					cf.radioToken(out, "sfyyh","Y+��&N+��",sfpzqtyh);
			  %> </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp; </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ż�����</td>
      <td colspan="3"> 
        <input type="text" name="yhyy" value="<%=pzqtyhnr%>" size="76" maxlength="200">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>����ԭ����</td>
      <td width="34%"> 
        <input type="text" name="wdzgce" value="" size="20" maxlength="16" onChange="calValue(insertform)" >
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>�ۿ���</td>
      <td width="31%"> 
        <input type="text" name="zkl" size="8" maxlength="8" value="10" onChange="calValue(insertform)" >
        <b><font color="#0000FF">��>0��<=10��</font></b> </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">����ǩԼ��</font></td>
      <td width="34%"> 
        <input type="text" name="qye" value="" size="20" maxlength="16" readonly >
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>˰��ٷֱ�</td>
      <td width="31%"> 
        <input type="text" name="suijinbfb" value="" size="8" maxlength="16" onChange="calValue(insertform)" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000FF">��ǰ��˰��</font></td>
      <td width="34%">
        <input type="text" name="zqsuijin" value="" size="20" maxlength="16" readonly >
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">�ۺ�˰��</font></td>
      <td width="31%">
        <input type="text" name="suijin" value="" size="20" maxlength="16" readonly >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��ǰ�������</td>
      <td width="34%">
        <input type="text" name="zqguanlif" value="" size="20" maxlength="16" onChange="calValue(insertform)">
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000FF">�ۺ󣭹����</font></td>
      <td width="31%"> 
        <input type="text" name="guanlif" value="" size="20" maxlength="16" readonly>
      </td>
    </tr>

    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��Ʒ�</td>
      <td width="34%"> 
        <input type="text" name="sjf" value="0" size="20" maxlength="16"  onKeyUp="keyGo(glf)">
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>�����</td>
      <td width="31%"> 
        <input type="text" name="glf" value="0" size="20" maxlength="16" onKeyUp="keyGo(sffj[0])">
        <input type="hidden" name="hbqye" value="0" size="20" maxlength="16" onKeyUp="keyGo(sffj[0])">
      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
   <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ�ȯ</td>
      <td width="34%"> 
        <input type="radio" name="sffj"  value="Y" onKeyUp="keyGo(fjje)">
        �� 
        <input type="radio" name="sffj"  value="N" onKeyUp="keyGo(sfyrz[0])">
        �� </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">��ȯ�ܽ��</td>
      <td width="34%"> 
        <input type="text" name="fjje" value="" size="20" maxlength="20" onKeyUp="keyGo(gsfje)">
      </td>
      <td width="19%" align="right">��˾�е������</td>
      <td width="31%"> 
        <input type="text" name="gsfje" value="" size="20" maxlength="20" onKeyUp="keyGo(sfyrz[0])">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�Ƿ�����֤</td>
      <td width="34%"> 
        <input type="radio" name="sfyrz"  value="Y" onKeyUp="keyGo(sfyyh[0])">
        �� 
        <input type="radio" name="sfyrz"  value="N" onKeyUp="keyGo(sfyyh[0])">
        �� </td>
      <td width="19%" align="right">��֤�г�</td>
      <td width="31%"> 
        <select name="rzsc" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <option value=""></option>
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx='F2' and ssdw='"+ssfgs+"' and cxbz='N' order by dwbh","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�μӹ�˾�����</td>
      <td colspan="3"> 
        <select name="cxhdbm" style="FONT-SIZE:12PX;WIDTH:545PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(����'||jc_cxhd.dj||'��)'||DECODE(jsbz,'Y','���ѽ�����','N','') c2 from jc_cxhd where jc_cxhd.fgsbh='"+ssfgs+"' and jc_cxhd.hdlx in('1','2') order by jc_cxhd.cxhdmc",cxhdbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right" bgcolor="#FFFFFF">�μ�С�������</td>
      <td colspan="3"> 
        <select name="cxhdbmxq" style="FONT-SIZE:12PX;WIDTH:545PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(����'||jc_cxhd.dj||'��)'||DECODE(jsbz,'Y','���ѽ�����','N','') c2 from jc_cxhd where jc_cxhd.fgsbh='"+ssfgs+"' and jc_cxhd.hdlx='3'  order by jc_cxhd.cxhdmc",cxhdbmxq);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�μ�չ������</td>
      <td colspan="3"> 
        <select name="cxhdbmzh" style="FONT-SIZE:12PX;WIDTH:545PX">
          <option value=""></option>
          <%
	cf.selectItem(out,"select jc_cxhd.cxhdmc c1,jc_cxhd.cxhdmc||'(����'||jc_cxhd.dj||'��)'||DECODE(jsbz,'Y','���ѽ�����','N','') c2 from jc_cxhd where jc_cxhd.fgsbh='"+ssfgs+"' and jc_cxhd.hdlx='4'  order by jc_cxhd.cxhdmc",cxhdbmzh);
%> 
        </select>
      </td>
    </tr>
	</TABLE>



<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��װ��־</td>
      <td width="34%"><%
	cf.radioToken(out, "jzbz","1+��װ&2+��װ",jzbz);
%></td>
      <td rowspan="5" align="right" width="19%"><font color="#FF0033">*</font>��Ϣ��Դ 
      </td>
      <td rowspan="5" width="31%"> 
        <select name="xxlybm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyGo(jyjdrq)" size="8" multiple>
          <%
	cf.mutilSelectItem(out,"select xxlybm,xxlymc from dm_xxlybm order by xxlybm","select xxlybm from crm_khxxly where khlx='2' and khbh='"+khbh+"'");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">����</td>
      <td width="34%"> 
        <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(fgflbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">���</td>
      <td width="34%"> 
        <select name="fgflbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(ysbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">��ɫ</td>
      <td width="34%"> 
        <select name="ysbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(czbm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select ysbm,ysmc from dm_ysbm order by ysbm","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">����</td>
      <td width="34%"> 
        <select name="czbm" style="FONT-SIZE:12PX;WIDTH:152PX" onKeyUp="keyTo(xxlybm)">
          <option value=""></option>
          <%
	cf.selectItem(out,"select czbm,czmc from dm_czbm order by czbm","");
%> 
        </select>
      </td>
    </tr>
	</TABLE>



<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">����ʱ��</td>
      <td width="34%"> 
        <input type="radio" name="kgsjqd" value="Y" checked>
        ��ȷ�� 
        <input type="radio" name="kgsjqd" value="N">
        δȷ��</td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>���齻������</td>
      <td width="34%"> 
        <input type="text" name="jyjdrq" value="" size="20" maxlength="10" onKeyUp="keyGo(qyrq)"  ondblclick="JSCalendar(this)">
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>ǩԼ����</td>
      <td width="31%"> 
        <input type="text" name="qyrq" value="<%=cf.today()%>" size="20" maxlength="10" onKeyUp="keyGo(kgrq)"  ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>��ͬ��������</td>
      <td width="34%"> 
        <input type="text" name="kgrq" value="" size="20" maxlength="10" onKeyUp="keyGo(jgrq)"  ondblclick="JSCalendar(this)">
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font>��ͬ��������</td>
      <td width="31%"> 
        <input type="text" name="jgrq" size="20" maxlength="10" onKeyUp="keyTo(hdbz)"  ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font>�ص���־</td>
      <td width="34%"> 
        <select name="hdbz" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_hdbz(insertform)" onKeyUp="keyGo(bz)">
          <%
	cf.selectToken(out,"1+�ǻص�&2+���ʦ�ص�&3+ʩ���ӻص�&4+�Ͽͻ��ص�&5+Ա���ص�&6+�೤�ص�&7+��¥��&8+������&9+����",hdbz);
%> 
        </select>
      </td>
      <td width="19%" align="right">�ص���</td>
      <td width="31%"> 
        <input type="text" name="hdr" value="<%=hdr%>" size="20" maxlength="20"  >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�ص�װ�޵�ַ</td>
      <td colspan="3"> 
        <input type="text" name="cgdz" value="<%=cgdz%>" size="76" maxlength="100" onKeyUp="keyGo(bz)" >
      </td>
    </tr>
  </TABLE>


<BR>  
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">ˮ�ʷ���������</td>
      <td width="34%"> 
        <input type="radio" name="sffk" value="Y">
        ���� 
        <input type="radio" name="sffk" value="N">
        δ���� </td>
      <td width="19%" align="right">&nbsp;</td>
      <td width="31%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right">�Ǽǿ���</td>
      <td width="34%"> 
        <input type="text" name="djkh" value="" size="20" maxlength="20" >
      </td>
      <td width="19%" align="right">��������</td>
      <td width="31%"> 
        <input type="text" name="fkrq" value="" size="20" maxlength="10"  ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%" align="right"><font color="#FF0033">*</font><font color="#0000CC">ǩԼ����</font></td>
      <td width="34%"> 
        <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+zxdm+"'","");
%> 
        </select>
      </td>
      <td width="19%" align="right"><font color="#FF0033">*</font><font color="#0000CC">�����ֹ�˾</font></td>
      <td width="31%"> 
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX" >
          <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'","");
%> 
        </select>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right"><font color="#FF0033">*</font><font color="#0000CC">¼��ʱ��</font></div>
      </td>
      <td width="34%"> 
        <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly onKeyUp="keyGo(lrr)">
      </td>
      <td width="19%"> 
        <div align="right"><font color="#FF0033">*</font><font color="#0000CC">��Ϣ¼����</font></div>
      </td>
      <td width="31%"> 
        <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly onKeyUp="keyGo(bz)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td width="16%"> 
        <div align="right">��ע</div>
      </td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="2" onKeyUp="keyTo(savebutton)"></textarea>
      </td>
    </tr>
    <tr> 
      <td colspan="4" align="center"> 
        <input type="button"  value="����" onClick="f_do(insertform)" name="savebutton">
        <input type="button"  value="���ӱ��۴�ӡԤ��" onClick="f_ck(insertform)" name="ck" >
        <input type="hidden" name="sfcjq" value="1" size="20" maxlength="8" >
        <input type="hidden" name="sffby" value="1" size="20" maxlength="8" >
        <input type="hidden" name="hyklxbm" value="" size="20" maxlength="8" >
        <input type="hidden" name="hykh" value="" size="20" maxlength="8" >
        <input type="hidden" name="yxsjs" value="" size="20" maxlength="10" >
        <input type="hidden" name="yxsjz" value="" size="20" maxlength="10" >
        <input type="hidden" name="sjsbh" value="" size="20" maxlength="5" >
      </td>
    </tr>
  </table>
</form>

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function calValue(FormName)
{  
	var qye=FormName.wdzgce.value*FormName.zkl.value/10.0;
	qye=round(qye,2);
	FormName.qye.value=qye;

	var zqsuijin=FormName.wdzgce.value*FormName.suijinbfb.value/100.0;
	FormName.zqsuijin.value=round(zqsuijin,2);      

	var suijin=FormName.qye.value*FormName.suijinbfb.value/100.0;
	FormName.suijin.value=round(suijin,2);      

	var guanlif=FormName.zqguanlif.value*FormName.zkl.value/10.0;
	FormName.guanlif.value=round(guanlif,2);      
	
	FormName.pmjj.value=parseInt(FormName.qye.value/FormName.fwmj.value);      
}    


function cf_hdbz(FormName){  
	if(FormName.hdbz.value=="1") {//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص�;5��Ա���ص�
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		FormName.cgdz.disabled=false;
		FormName.hdr.disabled=false;
	}
}      

function cf_fwdz(FormName)
{  
	FormName.xqbm.value=strTrim(FormName.xqbm.value);
	FormName.louhao.value=strTrim(FormName.louhao.value);
	FormName.fwdz.value=FormName.cqbm.options[FormName.cqbm.selectedIndex].text+FormName.xqbm.value+FormName.louhao.value;
}      

function f_do(FormName)//����FormName:Form������
{
	calValue(FormName);


	if(	javaTrim(FormName.hth)=="") {
		alert("������[��ͬ��]��");
		FormName.hth.focus();
		return false;
	}
	<%
	if (bjjb.equals(""))
	{
		%>
		if(	!radioChecked(FormName.bjjb)) {
			alert("��ѡ��[���ۼ���]��");
			FormName.bjjb[0].focus();
			return false;
		}
		<%
	}
	else 
	{
		%>
		if(!FormName.bjjb.checked) {
			alert("������[���ۼ���]��");
			FormName.bjjb.focus();
			return false;
		}
		<%
	}
	%>

	if(	javaTrim(FormName.khxm)=="") {
		alert("������[�ͻ�����]��");
		FormName.khxm.focus();
		return false;
	}
	if(	!radioChecked(FormName.xb)) {
		alert("��ѡ��[�Ա�]��");
		FormName.xb[0].focus();
		return false;
	}
	if(FormName.lxfs.value=="" && FormName.qtdh.value=="") {
		alert("������[�ֻ�]��[�����绰]��");
		FormName.lxfs.focus();
		return false;
	}
	if(!(isMPhone(FormName.lxfs, "�ֻ�"))) {
		return false;
	}
	if(!(isPhone(FormName.qtdh, "�����绰"))) {
		return false;
	}
	if(!(isEmail(FormName.email, "�����ʼ�"))) {
		return false;
	}

	if(	javaTrim(FormName.cqbm)=="") {
		alert("������[��������]��");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqbm)=="") {
		alert("������[С��/�ֵ�]��");
		FormName.xqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.louhao)=="") {
		alert("������[¥��/���ƺ�]��");
		FormName.louhao.focus();
		return false;
	}
	if(	javaTrim(FormName.fwdz)=="") {
		alert("������[���ݵ�ַ]��");
		FormName.fwdz.focus();
		return false;
	}
	
	if(	javaTrim(FormName.sjs)=="") {
		alert("������[���ʦ]��");
		FormName.sjs.focus();
		return false;
	}
	if(	javaTrim(FormName.khlxbm)=="") {
		alert("��ѡ��[��ϵ�ͻ�]��");
		FormName.khlxbm.focus();
		return false;
	}

	if(	!selectChecked(FormName.xxlybm)) {
		alert("������[��Ϣ��Դ]��");
		FormName.xxlybm.focus();
		return false;
	}

	if(	javaTrim(FormName.hbqye)=="") {
		alert("������[������ĿǩԼ��]��");
		FormName.hbqye.focus();
		return false;
	}
	if(!(isFloat(FormName.hbqye, "������ĿǩԼ��"))) {
		return false;
	}
	if (FormName.sfcjq.value=="2" || FormName.sffby.value=="2")
	{
		if (FormName.hbqye.value=="0")
		{
			alert("������[������ĿǩԼ��]��");
			FormName.hbqye.select();
			return false;
		}
	}
	else{
		FormName.hbqye.value="0";
	}

	if(	javaTrim(FormName.fwmj)=="") {
		alert("������[���]��");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "���"))) {
		return false;
	}
	if (parseInt(FormName.fwmj.value)==0)
	{
		alert("[���]����Ϊ0��");
		FormName.fwmj.select();
		return false;
	}


	if(	!radioChecked(FormName.sfyyh)) {
		alert("��ѡ��[�Ƿ����Ż�]��");
		FormName.sfyyh[0].focus();
		return false;
	}
	if (FormName.sfyyh[0].checked)
	{
		if(	javaTrim(FormName.yhyy)=="") {
			alert("������[�Ż�����]��");
			FormName.yhyy.focus();
			return false;
		}
	}
	else{
		FormName.yhyy.value="";
	}


	if(	javaTrim(FormName.wdzgce)=="") {
		alert("������[����ԭ����]��");
		FormName.wdzgce.focus();
		return false;
	}
	if(!(isFloat(FormName.wdzgce, "����ԭ����"))) {
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)==0)
	{
		alert("[����ԭ����]����Ϊ0��");
		FormName.wdzgce.select();
		return false;
	}
	if (parseFloat(FormName.wdzgce.value)<parseFloat(FormName.qye.value))
	{
		alert("[����ԭ����]����С��[����ǩԼ��]��");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.qye)=="") {
		alert("������[����ǩԼ��]��");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "����ǩԼ��"))) {
		return false;
	}
	if (parseFloat(FormName.qye.value)==0)
	{
		alert("[����ǩԼ��]����Ϊ0��");
		FormName.qye.select();
		return false;
	}
	if(	javaTrim(FormName.zkl)=="") {
		alert("������[�ۿ���]��");
		FormName.zkl.focus();
		return false;
	}
	if(!(isFloat(FormName.zkl, "�ۿ���"))) {
		return false;
	}
	if (FormName.zkl.value<0 || FormName.zkl.value>10)
	{
		alert("����[�ۿ���]Ӧ����0��10֮�䣡");
		FormName.zkl.select();
		return false;
	}


	
	if(	javaTrim(FormName.sjf)=="") {
		alert("������[��Ʒ�]��");
		FormName.sjf.focus();
		return false;
	}
	if(!(isFloat(FormName.sjf, "��Ʒ�"))) {
		return false;
	}
	if(	javaTrim(FormName.suijinbfb)=="") {
		alert("������[˰��ٷֱ�]��");
		FormName.suijinbfb.focus();
		return false;
	}
	if(!(isFloat(FormName.suijinbfb, "˰��ٷֱ�"))) {
		return false;
	}
	if (FormName.suijinbfb.value<0 || FormName.suijinbfb.value>100)
	{
		alert("����[˰��ٷֱ�]Ӧ����0��100֮�䣡");
		FormName.suijinbfb.select();
		return false;
	}
	if(	javaTrim(FormName.zqsuijin)=="") {
		alert("������[��ǰ˰��]��");
		FormName.zqsuijin.select();
		return false;
	}
	if(!(isFloat(FormName.zqsuijin, "��ǰ˰��"))) {
		return false;
	}
	if(	javaTrim(FormName.suijin)=="") {
		alert("������[�ۺ�˰��]��");
		FormName.suijin.select();
		return false;
	}
	if(!(isFloat(FormName.suijin, "�ۺ�˰��"))) {
		return false;
	}
	if(	javaTrim(FormName.glf)=="") {
		alert("������[�����]��");
		FormName.select.focus();
		return false;
	}
	if(!(isFloat(FormName.glf, "�����"))) {
		return false;
	}
	if(	javaTrim(FormName.zqguanlif)=="") {
		alert("������[��ǰ�����]��");
		FormName.zqguanlif.select();
		return false;
	}
	if(!(isFloat(FormName.zqguanlif, "��ǰ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.guanlif)=="") {
		alert("������[�ۺ�����]��");
		FormName.guanlif.select();
		return false;
	}
	if(!(isFloat(FormName.guanlif, "�ۺ�����"))) {
		return false;
	}



	if(	javaTrim(FormName.pmjj)=="") {
		alert("������[ÿƽ�׾���]��");
		FormName.pmjj.focus();
		return false;
	}
	if(!(isNumber(FormName.pmjj, "ÿƽ�׾���"))) {
		return false;
	}






	if(	!radioChecked(FormName.sffj)) {
		alert("��ѡ��[�Ƿ�ȯ]��");
		FormName.sffj[0].focus();
		return false;
	}

	if (FormName.sffj[0].checked)
	{
		if(	javaTrim(FormName.fjje)=="") {
			alert("������[�����ܽ��]��");
			FormName.fjje.focus();
			return false;
		}
		if(!(isFloat(FormName.fjje, "�����ܽ��"))) {
			return false;
		}
		if(	javaTrim(FormName.gsfje)=="") {
			alert("������[��˾�е������]��");
			FormName.gsfje.focus();
			return false;
		}
		if(!(isFloat(FormName.gsfje, "��˾�е������"))) {
			return false;
		}
		if (parseFloat(FormName.fjje.value)<parseFloat(FormName.gsfje.value))
		{
			alert("[�����ܽ��]����С��[��˾�е������]��");
			FormName.gsfje.select();
			return false;
		}
	}
	else{
		FormName.fjje.value="";
		FormName.gsfje.value="";
	}

	if(	!radioChecked(FormName.sfyrz)) {
		alert("��ѡ��[�Ƿ�����֤]��");
		FormName.sfyrz[0].focus();
		return false;
	}
	if (FormName.sfyrz[0].checked)
	{
		if(	javaTrim(FormName.rzsc)=="") {
			alert("������[��֤�г�]��");
			FormName.rzsc.focus();
			return false;
		}
	}
	else{
		FormName.rzsc.value="";
	}

	if(	javaTrim(FormName.qyrq)=="") {
		alert("������[ǩԼ����]��");
		FormName.qyrq.focus();
		return false;
	}
	if(!(isDatetime(FormName.qyrq, "ǩԼ����"))) {
		return false;
	}
	if (FormName.qyrq.value>"<%=cf.today()%>")
	{
		alert("[ǩԼ����]���ܴ���[����]��");
		FormName.qyrq.select();
		return false;
	}
	if (FormName.qyrq.value>"2008-05-31")
	{
		alert("[ǩԼ����]���ܴ���[2008-05-31]��");
		FormName.qyrq.select();
		return false;
	}

	if (FormName.kgsjqd[0].checked)
	{
		if(	javaTrim(FormName.jyjdrq)=="") {
			alert("������[���齻������]��");
			FormName.jyjdrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jyjdrq, "���齻������"))) {
			return false;
		}
		if(	javaTrim(FormName.kgrq)=="") {
			alert("������[��ͬ��������]��");
			FormName.kgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.kgrq, "��ͬ��������"))) {
			return false;
		}
		if(	javaTrim(FormName.jgrq)=="") {
			alert("������[��ͬ��������]��");
			FormName.jgrq.focus();
			return false;
		}
		if(!(isDatetime(FormName.jgrq, "��ͬ��������"))) {
			return false;
		}
		if (FormName.qyrq.value>FormName.jyjdrq.value)
		{
			alert("[���齻������]Ӧ����[ǩԼ����]��");
			FormName.jyjdrq.select();
			return false;
		}

		if (FormName.jyjdrq.value>FormName.kgrq.value)
		{
			alert("[��ͬ��������]Ӧ����[���齻������]��");
			FormName.kgrq.select();
			return false;
		}

		if (FormName.kgrq.value>=FormName.jgrq.value)
		{
			alert("[��ͬ��������]Ӧ����[��ͬ��������]��");
			FormName.jgrq.select();
			return false;
		}
	}
	else{
		if (FormName.jyjdrq.value!="")
		{
			alert("[����ʱ��]δȷ��������¼��[���齻������]��");
			FormName.jyjdrq.select();
			return false;
		}
		if (FormName.kgrq.value!="")
		{
			alert("[����ʱ��]δȷ��������¼��[��ͬ��������]��");
			FormName.kgrq.select();
			return false;
		}
		if (FormName.jgrq.value!="")
		{
			alert("[����ʱ��]δȷ��������¼��[��ͬ��������]��");
			FormName.jgrq.select();
			return false;
		}
	}



	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}


	if(	javaTrim(FormName.hdbz)=="") {
		alert("��ѡ��[�ص���־]��");
		FormName.hdbz.focus();
		return false;
	}

	if(FormName.hdbz.value=="1") {//1���ǻص��� 2�����ʦ�ص���3��ʩ���ӻص���4���Ͽͻ��ص�
		FormName.cgdz.value="";
		FormName.hdr.value="";

		FormName.cgdz.disabled=true;
		FormName.hdr.disabled=true;
	}
	else {
		if(	javaTrim(FormName.cgdz)=="") {
			alert("������[�ص�װ�޵�ַ]��");
			FormName.cgdz.focus();
			return false;
		}
		if(	javaTrim(FormName.hdr)=="") {
			alert("������[�ص���]��");
			FormName.hdr.focus();
			return false;
		}
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("������[��Ϣ¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[ǩԼ����]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.fgsbh)=="") {
		alert("������[�����ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(!(isDatetime(FormName.yxsjs, "��Ա��Чʱ��ʼ"))) {
		return false;
	}
	if(!(isDatetime(FormName.yxsjz, "��Ա��Чʱ��ֹ"))) {
		return false;
	}
	if(	!radioChecked(FormName.jzbz)) {
		alert("��ѡ��[��װ��־]��");
		FormName.jzbz[0].focus();
		return false;
	}


	FormName.action="SaveInsertBlCrm_khxx.jsp";
	FormName.submit();

	return true;
}



//-->
</SCRIPT>
