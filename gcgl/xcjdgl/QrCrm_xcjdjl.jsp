<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");

String khbh=null;
String sqrq=null;
String sqr=null;
String sqrlxdh=null;
String sfxtp=null;
String jhjdrq=null;
String jhjdsj=null;
String sqsm=null;
String zcwcsj=null;
String lrr=null;
String lrsj=null;
String lrbm=null;
String jdjlh=cf.GB2Uni(request.getParameter("jdjlh"));


String fgsbh=null;
String khxm=null;
String fwdz=null;
String hth=null;
String sjs=null;
String dwbh=null;
String dwmc=null;

String pdr=null;
String pdsj=null;
String jlbz=null;
String sgd=null;
String sgbz=null;
String zjxm=null;

String qyrq=null;
String jyjdrq=null;
String kgrq=null;
String jgrq=null;

String sybgcrq=null;
String szqsj=null;

String sjkgrq=null;
String sjjgrq=null;
String gcjdbm=null;
String sjwjrq=null;
String gj=null;
String dd=null;
String khjl=null;
String dmjl="";
String dmjldh="";
int jdqrcs=0;

int row=0;

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,jdqrcs,sqrq,sqr,sqrlxdh,DECODE(sfxtp,'Y','��','N','��') sfxtp,jhjdrq,jhjdsj,sqsm,zcwcsj,lrr,lrsj,dwmc ";
	ls_sql+=" from  crm_xcjdjl,sq_dwxx";
	ls_sql+=" where crm_xcjdjl.jdjlh='"+jdjlh+"' and crm_xcjdjl.lrbm=sq_dwxx.dwbh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		jdqrcs=rs.getInt("jdqrcs");
		sqrq=cf.fillNull(rs.getDate("sqrq"));
		sqr=cf.fillNull(rs.getString("sqr"));
		sqrlxdh=cf.fillNull(rs.getString("sqrlxdh"));
		sfxtp=cf.fillNull(rs.getString("sfxtp"));
		jhjdrq=cf.fillNull(rs.getDate("jhjdrq"));
		jhjdsj=cf.fillNull(rs.getString("jhjdsj"));
		sqsm=cf.fillNull(rs.getString("sqsm"));
		zcwcsj=cf.fillNull(rs.getDate("zcwcsj"));
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		lrbm=cf.fillNull(rs.getString("dwmc"));
	}
	rs.close();
	ps.close();

	ls_sql="select khjl,gj,dd,fgsbh,khxm,fwdz,hth,sjs,crm_khxx.dwbh,dwmc,qyrq,jyjdrq,kgrq,jgrq,sjkgrq,sjjgrq,gcjdbm,sjwjrq,sybgcrq,szqsj   ,pdr,pdsj,jlbz,sgd,sgbz,zjxm";
	ls_sql+=" from  crm_khxx,sq_dwxx";
	ls_sql+=" where  crm_khxx.dwbh=sq_dwxx.dwbh and crm_khxx.khbh='"+khbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		khjl=cf.fillNull(rs.getString("khjl"));
		gj=cf.fillNull(rs.getString("gj"));
		dd=cf.fillNull(rs.getString("dd"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
		jyjdrq=cf.fillNull(rs.getDate("jyjdrq"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));
		gcjdbm=cf.fillNull(rs.getString("gcjdbm"));
		sjwjrq=cf.fillNull(rs.getDate("sjwjrq"));

		sybgcrq=cf.fillNull(rs.getDate("sybgcrq"));
		szqsj=cf.fillNull(rs.getDate("szqsj"));

		pdr=cf.fillNull(rs.getString("pdr"));
		pdsj=cf.fillNull(rs.getDate("pdsj"));
		jlbz=cf.fillNull(rs.getString("jlbz"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
	}
	rs.close();
	ps.close();

	ls_sql="select sjs ";
	ls_sql+=" from  crm_jzsjs";
	ls_sql+=" where khbh='"+khbh+"'";
	ls_sql+=" order by xh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sjs+="��"+rs.getString("sjs");
	}
	rs.close();
	ps.close();

	ls_sql="select yhmc,dh";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where dwbh='"+dwbh+"' and xzzwbm='���澭��' ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dmjl=rs.getString("yhmc");
		dmjldh=rs.getString("dh");
	}
	rs.close();
	ps.close();


	//�����������Ŀ
	ls_sql="delete from crm_jdxmmx";
	ls_sql+=" where jdjlh='"+jdjlh+"'";
	ls_sql+=" and jdxmbm not in(select jdxmbm from dm_jdxmbm)";
	ps= conn.prepareStatement(ls_sql);
	ps.executeUpdate();
	ps.close();



%>

<html>
<head>
<title>�������룭��ȷ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE2 {color: #0000FF}
.STYLE3 {
	color: #0000FF;
	font-weight: bold;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform"  >
<div align="center">�������룭��ȷ�ϣ����׼�¼�ţ�<%=jdjlh%>��</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
  <tr bgcolor="#FFFFFF">
    <td width="18%" align="right"><font color="#0000FF">�ͻ����</font> </td>
    <td width="32%"><%=khbh%> </td>
    <td width="18%" align="right"><font color="#0000FF">��ͬ��</font> </td>
    <td width="32%"><%=hth%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">�ͻ�����</font> </td>
    <td><%=khxm%> </td>
    <td align="right"><font color="#0000FF">���̵���</font></td>
    <td><%=zjxm%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ݵ�ַ</font></td>
    <td colspan="3"><%=fwdz%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ʩ����</font></td>
    <td><%
	cf.selectItem(out,"select sgd,sgdmc||DECODE(cxbz,'Y','���ѳ�����','N','')||'��'||dh||'��' from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
    <td align="right"><font color="#0000FF">ʩ������</font></td>
    <td><%=sgbz%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ܼ�</span></td>
    <td><%=gj%></td>
    <td align="right"><span class="STYLE2">����</span></td>
    <td><%=dd%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">���ʦ</font> </td>
    <td><%=sjs%> </td>
    <td align="right"><font color="#0000FF">ǩԼ����</font> </td>
    <td><%=dwmc%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><span class="STYLE2">�ͻ�����</span></td>
    <td><%=khjl%></td>
    <td align="right"><span class="STYLE2">�곤���绰</span></td>
    <td><%=dmjl%>��<%=dmjldh%>��</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">ǩԼ����</font></td>
    <td><%=qyrq%> </td>
    <td align="right"><font color="#0000FF">���齻������</font></td>
    <td><%=jyjdrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=kgrq%> </td>
    <td align="right"><font color="#0000FF">��ͬ��������</font></td>
    <td><%=jgrq%> </td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td colspan="4" align="right" bgcolor="#E8E8FF">&nbsp;</td>
  </tr>
</table>




<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">ȷ�ϴ���</td>
	<td  width="15%">������Ŀ</td>
	<td  width="6%">�Ƿ�ͬ��</td>
	<td  width="13%">ȷ��ʱ��</td>
	<td  width="7%">ȷ����</td>
	<td  width="59%">ȷ��˵��</td>
</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT jdqrcs,jdxmmc,DECODE(sfty,'Y','ͬ��','N','��ͬ��','M','����ȷ��'),qrsj,qrr,qrsm ";
	ls_sql+=" FROM crm_jdqrjl,dm_jdxmbm  ";
    ls_sql+=" where crm_jdqrjl.jdxmbm=dm_jdxmbm.jdxmbm(+)";
    ls_sql+=" and crm_jdqrjl.jdjlh='"+jdjlh+"'";
    ls_sql+=" order by jdqrcs,crm_jdqrjl.jdxmbm,crm_jdqrjl.qrsj";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setDateType ("long");

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("jdqrcs","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);

	pageObj.displayDate();
%> 
</table>


<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������</td> 
  <td width="32%"><%=sqrq%></td>
  <td align="right" width="18%">������</td> 
  <td width="32%"><%=sqr%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">��������ϵ�绰</td> 
  <td colspan="3"><%=sqrlxdh%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">�ƻ���������</td> 
  <td width="32%"><%=jhjdrq%></td>
  <td align="right" width="18%">�ƻ�����ʱ��</td> 
  <td width="32%"><%=jhjdsj%> 
    ʱ</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right">�Ƿ�������</td>
  <td><%=sfxtp%></td>
  <td align="right">������ʱ��</td>
  <td><%=zcwcsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%">����˵��</td> 
  <td colspan="3"><%=sqsm%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right">¼����</td>
  <td><%=lrr%></td>
  <td align="right">¼��ʱ��</td>
  <td><%=lrsj%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" bgcolor="#FFFFFF">¼�벿��</td>
  <td>
    <%=dwmc%>
  </td>
  <td align="right">&nbsp;</td>
  <td>&nbsp;</td>
</tr>
  </table>


<table border="1" cellspacing="0" cellpadding="1" width="160%" style='FONT-SIZE: 13px' >
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">���</td>
	<td  width="5%">��������</td>
	<td  width="6%">������Ա</td>
	<td  width="9%">������Ա�绰</td>
	<td  width="4%"><span class="STYLE3">����ʱ���Ƿ�ͬ��</span></td>
	<td  width="6%"><span class="STYLE3">ȷ��ʱ��</span></td>
	<td  width="4%"><span class="STYLE3">ȷ����</span></td>
	<td  width="32%"><span class="STYLE3">ȷ��˵��</span></td>
	<td  width="28%">��������</td>
</tr>
<%
	String clzt=null;
	String jdqrlx=null;
	String jdxmbm=null;
	String jdxmmc=null;
	String jdry="";
	String jdrydh="";
	String jdnr="";
	String bg1="E8E8FF";
	String bg2="FFFFFF";

//	ls_sql+=" and dm_jdxmbm.jdqrlx in(select crm_jdqrqx.jdqrlx  from sq_yhssz,crm_jdqrqx where sq_yhssz.yhzbh=crm_jdqrqx.yhzbh  and sq_yhssz.yhdlm='"+yhdlm+"' )";

	ls_sql="SELECT crm_jdxmmx.clzt,dm_jdxmbm.jdqrlx,crm_jdxmmx.jdxmbm,dm_jdxmbm.jdxmmc,crm_jdxmmx.jdry,crm_jdxmmx.jdrydh,crm_jdxmmx.jdnr";
	ls_sql+=" FROM crm_jdxmmx,dm_jdxmbm";
	ls_sql+=" where crm_jdxmmx.jdxmbm=dm_jdxmbm.jdxmbm(+) and crm_jdxmmx.jdjlh='"+jdjlh+"'";
	ls_sql+=" order by crm_jdxmmx.jdxmbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		clzt=cf.fillNull(rs.getString("clzt"));
		jdqrlx=cf.fillNull(rs.getString("jdqrlx"));
		jdxmbm=cf.fillNull(rs.getString("jdxmbm"));
		jdxmmc=cf.fillNull(rs.getString("jdxmmc"));
		jdry=cf.fillNull(rs.getString("jdry"));
		jdrydh=cf.fillNull(rs.getString("jdrydh"));
		jdnr=cf.fillNull(rs.getString("jdnr"));

		String sfty="";
		String qrsj="";
		String qrr="";
		String qrsm="";
		if (!clzt.equals("1"))//1��δȷ�ϣ�2��ȷ��ͬ�⣻3��ȷ�ϲ�ͬ��
		{
			ls_sql="select sfty,qrsj,qrr,qrsm";
			ls_sql+=" from crm_jdqrjl";
			ls_sql+=" where jdjlh='"+jdjlh+"' and  jdxmbm='"+jdxmbm+"' and  jdqrcs='"+jdqrcs+"'";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				sfty=cf.fillNull(rs1.getString("sfty"));
				qrsj=cf.fillNull(rs1.getString("qrsj"));
				qrr=cf.fillNull(rs1.getString("qrr"));
				qrsm=cf.fillNull(rs1.getString("qrsm"));
			}
			rs1.close();
			ps1.close();
		}

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  sq_yhssz,crm_jdqrqx";
		ls_sql+=" where sq_yhssz.yhzbh=crm_jdqrqx.yhzbh and sq_yhssz.yhdlm='"+yhdlm+"' and crm_jdqrqx.jdqrlx='"+jdqrlx+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)//��Ȩȷ����Ŀ
		{
			row++;

			%>
			<tr bgcolor="<%if (row%2==0){out.print(bg1);}else {out.print(bg2);}%>" align="center">
			<td><%=row%></td>
			<td><%=jdxmmc%>
				<input type="hidden" name="jdxmbm" value="<%=jdxmbm%>">			</td>
			<td>
				<input type="text" name="jdry" value="<%=jdry%>" size="10" maxlength="20" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"   >
			</td>
			<td>
				<input type="text" name="jdrydh" value="<%=jdrydh%>" size="20" maxlength="40" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid"  >
			</td>
			<td>
				<select name="sfty" style="FONT-SIZE:12PX;WIDTH:52PX">
				<option value=""></option>
				<%
					cf.selectToken(out,"Y+ͬ��&N+��ͬ��&M+����ȷ��",sfty);
				%>
				</select>			</td>
			<td>
				<input type="text" name="qrsj" size="10" value="<%=cf.today()%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[<%=row%>])">			</td>
			<td>
				<input type="text" name="qrr" size="6" value="<%=yhmc%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[<%=row%>])">			</td>
			<td>
				<input type="text" name="qrsm" size="70" maxlength="200"  value="<%=qrsm%>" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" onKeyUp="keyGo(sl[<%=row%>])">			</td>
			<td align="left"><%=jdnr%></td>
			<%
		}
		else{
			%>
			<tr bgcolor="<%if (row%2==0){out.print(bg1);}else {out.print(bg2);}%>" align="center">
			<td>&nbsp;</td>
			<td><%=jdxmmc%>			</td>
			<td><%=jdry%></td>
			<td><%=jdrydh%></td>
			<td>
				<%
					cf.selectToken(out,"Y+ͬ��&N+��ͬ��&M+����ȷ��",sfty,true);
				%>			</td>
			<td><%=qrsj%></td>
			<td><%=qrr%></td>
			<td><%=qrsm%></td>
			<td align="left"><%=jdnr%></td>
			<%
		}

	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("<BR>����:" + e);
	out.print("<BR>SQL=" + ls_sql);
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
    <tr> 
      <td colspan="8" >
	<div align="center">
    <input type="hidden" name="jdjlh" value="<%=jdjlh%>" readonly>
    <input type="hidden" name="khbh" value="<%=khbh%>" readonly> 
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.jdjlh)=="") {
		alert("������[���׼�¼��]��");
		FormName.jdjlh.focus();
		return false;
	}

	if (<%=row%>==1)
	{
		for (var i=0;i<<%=row%>;i++ )
		{
			if(	javaTrim(FormName.jdry)=="") {
				alert("������[������Ա]��");
				FormName.jdry.focus();
				return false;
			}
			if(	javaTrim(FormName.jdrydh)=="") {
				alert("������[������Ա�绰]��");
				FormName.jdrydh.focus();
				return false;
			}
			if(	javaTrim(FormName.sfty)=="") {
				alert("������[����ʱ���Ƿ�ͬ��]��");
				FormName.sfty.focus();
				return false;
			}
			if(	javaTrim(FormName.qrr)=="") {
				alert("������[ȷ����]��");
				FormName.qrr.focus();
				return false;
			}
			if(	javaTrim(FormName.qrsj)=="") {
				alert("������[ȷ��ʱ��]��");
				FormName.qrsj.focus();
				return false;
			}

			if(FormName.sfty.value=="N") 
			{
				if(	javaTrim(FormName.qrsm)=="") {
					alert("������[ȷ��˵��]��");
					FormName.qrsm.focus();
					return false;
				}
			}
		}
	}
	else{
		for (var i=0;i<<%=row%>;i++ )
		{
			if(	javaTrim(FormName.sfty[i])=="") {
				alert("������[����ʱ���Ƿ�ͬ��]��");
				FormName.sfty[i].focus();
				return false;
			}
			if(	javaTrim(FormName.qrr[i])=="") {
				alert("������[ȷ����]��");
				FormName.qrr[i].focus();
				return false;
			}
			if(	javaTrim(FormName.qrsj[i])=="") {
				alert("������[ȷ��ʱ��]��");
				FormName.qrsj[i].focus();
				return false;
			}


			if(FormName.sfty[i].value=="N") 
			{
				if(	javaTrim(FormName.qrsm[i])=="")
				{
					alert("������[ȷ��˵��]��");
					FormName.qrsm[i].focus();
					return false;
				}
			}
		}
	}




	FormName.action="SaveQrCrm_xcjdjl.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
