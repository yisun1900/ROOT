<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String khbh=null;
String jgwzbm=null;
String tccplbbm=null;
String tcsjflbm=null;
String sfbxx=null;
String sfyxsj=null;
String jldw=null;
String sfxzsl=null;
String bzsl=null;
String sfkjm=null;
String yxjmzdsl=null;
String jmdj=null;
String sfkgh=null;
String khzdsl=null;
String ghzj=null;
String sfyqxtpp=null;
String sjsl=null;
String sjjshsl=null;
String sjjmsl=null;
String sjjmje=null;
String khbjjbbm=null;
String bjjbbm=null;
String sjsfsl=null;
String sjcj=null;
String sjsfje=null;
String sjsfycx=null;
String wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String wherejgwzbm=cf.getParameter(request,"jgwzbm");
String wheretccplbbm=cf.GB2Uni(request.getParameter("tccplbbm"));

String khxm=null;
String fwdz=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	ls_sql="select khbh,jgwzbm,bj_khzcxmxj.tcsjflbm,tcsjflmc,bj_khzcxmxj.tccplbbm,jxc_clxlbm.clxlmc,DECODE(sfbxx,'Y','��','N','��') sfbxx,DECODE(sfyxsj,'Y','�շ�','N','��') sfyxsj,a.bjjbmc khbjjbbm,b.bjjbmc,sjsfsl,sjcj,sjsfje,sjsfycx ,jldw,DECODE(bj_khzcxmxj.sfxzsl,'1','������Ӽ�','2','���ɳ���','3','����������') sfxzsl,bzsl,DECODE(bj_khzcxmxj.sfkjm,'1','���ɼ���','2','�ɼ���') sfkjm,bj_khzcxmxj.yxjmzdsl,jmdj,DECODE(sfkgh,'1','���ɻ�','2','�ɻ�') sfkgh,khzdsl,ghzj,DECODE(sfyqxtpp,'Y','��','N','��') sfyqxtpp,sjsl,sjjshsl,sjjmsl,sjjmje";
	ls_sql+=" FROM bj_khzcxmxj,jxc_clxlbm,bj_tcsjflbm,bdm_bjjbbm a,bdm_bjjbbm b  ";
    ls_sql+=" where bj_khzcxmxj.tccplbbm=jxc_clxlbm.clxlbm(+) and bj_khzcxmxj.tcsjflbm=bj_tcsjflbm.tcsjflbm(+) ";
    ls_sql+=" and bj_khzcxmxj.khbjjbbm=a.bjjbbm(+) and bj_khzcxmxj.bjjbbm=b.bjjbbm(+)";
	ls_sql+=" and  (bj_khzcxmxj.khbh='"+wherekhbh+"') and  (bj_khzcxmxj.jgwzbm='"+wherejgwzbm+"') and  (bj_khzcxmxj.tccplbbm="+wheretccplbbm+")  ";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		jgwzbm=cf.fillNull(rs.getString("jgwzbm"));
		tccplbbm=cf.fillNull(rs.getString("clxlmc"));
		tcsjflbm=cf.fillNull(rs.getString("tcsjflmc"));
		sfbxx=cf.fillNull(rs.getString("sfbxx"));
		sfyxsj=cf.fillNull(rs.getString("sfyxsj"));
		jldw=cf.fillNull(rs.getString("jldw"));
		sfxzsl=cf.fillNull(rs.getString("sfxzsl"));
		bzsl=cf.fillNull(rs.getString("bzsl"));
		sfkjm=cf.fillNull(rs.getString("sfkjm"));
		yxjmzdsl=cf.fillNull(rs.getString("yxjmzdsl"));
		jmdj=cf.fillNull(rs.getString("jmdj"));
		sfkgh=cf.fillNull(rs.getString("sfkgh"));
		khzdsl=cf.fillNull(rs.getString("khzdsl"));
		ghzj=cf.fillNull(rs.getString("ghzj"));
		sfyqxtpp=cf.fillNull(rs.getString("sfyqxtpp"));
		sjsl=cf.fillNull(rs.getString("sjsl"));
		sjjshsl=cf.fillNull(rs.getString("sjjshsl"));
		sjjmsl=cf.fillNull(rs.getString("sjjmsl"));
		sjjmje=cf.fillNull(rs.getString("sjjmje"));
		khbjjbbm=cf.fillNull(rs.getString("khbjjbbm"));
		bjjbbm=cf.fillNull(rs.getString("bjjbmc"));
		sjsfsl=cf.fillNull(rs.getString("sjsfsl"));
		sjcj=cf.fillNull(rs.getString("sjcj"));
		sjsfje=cf.fillNull(rs.getString("sjsfje"));
		sjsfycx=cf.fillNull(rs.getString("sjsfycx"));
	}
	rs.close();
	ps.close();

	if (khbjjbbm.equals(bjjbbm))
	{
		out.println("���󣡱���δ����");
		return;
	}

	String ssfgs="";
	String ysshbz="";
	ls_sql="SELECT ssfgs,ysshbz,khxm,fwdz";
	ls_sql+=" FROM crm_zxkhxx";
    ls_sql+=" where khbh='"+wherekhbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
	}
	rs.close();
	ps.close();

	String sfqyyssh="";
	String bjdysq="";
	ls_sql="SELECT sfqyyssh,bjdysq";
	ls_sql+=" FROM sq_dwxx";
    ls_sql+=" where dwbh='"+ssfgs+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfqyyssh=cf.fillNull(rs.getString("sfqyyssh"));//�Ƿ�����Ԥ�����  Y�����ã�N��������
		bjdysq=cf.fillNull(rs.getString("bjdysq"));//���۴�ӡ�Ƿ�����Ȩ  1��������Ȩ��2��ֻ��һ����Ȩ��3��ÿ�δ�ӡ������Ȩ
	}
	rs.close();
	ps.close();

	if (sfqyyssh.equals("Y") && ysshbz.equals("Y") )
	//N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ����S���޸ķ�����Ȩ
	{
		out.println("����������[Ԥ�����]�������ٵ��ۿ�"+ysshbz);
		return;
	}


%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
.STYLE2 {color: #0000CC}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="SaveEditBj_khzcxmxj.jsp" name="editform">
<div align="center">�޸��ײ��������</div>
<table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE2">�ͻ�����</span></td>
  <td><%=khxm%></td>
  <td align="right"><span class="STYLE2">���ݵ�ַ</span></td>
  <td><%=fwdz%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">�ͻ����</span></td> 
  <td width="32%"><%=khbh%>  </td>
  <td align="right" width="18%"><span class="STYLE2">�ṹλ��</span></td> 
  <td width="32%"><%=jgwzbm%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">��Ʒ���</span></td> 
  <td width="32%"> 
<%=tccplbbm%>  </td>
  <td align="right" width="18%"><span class="STYLE2">�ײ���������</span></td> 
  <td width="32%"><%=tcsjflbm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">�Ƿ��ѡ��</span></td> 
  <td width="32%"><%=sfbxx%>  </td>
  <td align="right" width="18%"><span class="STYLE2">�����Ƿ��շ�</span></td> 
  <td width="32%"><%=sfyxsj%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">������λ</span></td> 
  <td width="32%"><%=jldw%>  </td>
  <td align="right" width="18%"><span class="STYLE2">�Ƿ���������</span></td> 
  <td width="32%"><%=sfxzsl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">��׼����</span></td> 
  <td width="32%"><%=bzsl%> </td>
  <td align="right" width="18%"><span class="STYLE2">�Ƿ�ɼ���</span></td> 
  <td width="32%"><%=sfkjm%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">��������������</span></td> 
  <td width="32%"><%=yxjmzdsl%>  </td>
  <td align="right" width="18%"><span class="STYLE2">���ⵥ��</span></td> 
  <td width="32%"><%=jmdj%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">�Ƿ�ɸ���</span></td> 
  <td width="32%"><%=sfkgh%> </td>
  <td align="right" width="18%"><span class="STYLE2">�ɻ��������</span></td> 
  <td width="32%"><%=khzdsl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">�����ۼ�</span></td> 
  <td width="32%"><%=ghzj%>  </td>
  <td align="right" width="18%"><span class="STYLE2">�Ƿ�Ҫ����ͬƷ��</span></td> 
  <td width="32%"><%=sfyqxtpp%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">ʵ������</span></td> 
  <td width="32%"><%=sjsl%> </td>
  <td align="right" width="18%"><span class="STYLE2">ʵ�ʼ��������</span></td> 
  <td width="32%"><%=sjjshsl%>  </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">ʵ�ʼ�������</span></td> 
  <td width="32%"><%=sjjmsl%>  </td>
  <td align="right" width="18%"><span class="STYLE2">ʵ�ʼ�����</span></td> 
  <td width="32%"><%=sjjmje%></td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2">�ͻ����ۼ���</span></td> 
  <td width="32%"><%=khbjjbbm%>  </td>
  <td align="right" width="18%"><span class="STYLE2">�����󱨼ۼ���</span></td> 
  <td width="32%"><%=bjjbbm%> </td>
</tr>
<tr bgcolor="#FFFFFF">
  <td colspan="4" align="right" bgcolor="#FFFF66">&nbsp;</td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right"><span class="STYLE1">*</span>�����Ƿ��д���</td>
  <td colspan="3"><%
	cf.radioToken(out, "sjsfycx","1+�޴���&2+���������ƴ���&3+���������ƴ���",sjsfycx);
%></td>
  </tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE2"><span class="STYLE1">*</span>�����շ�����</span></td> 
  <td width="32%"> 
    <input type="text" name="sjsfsl" size="20" maxlength="17"  value="<%=sjsfsl%>" readonly>  </td>
  <td align="right" width="18%">&nbsp;</td> 
  <td width="32%">&nbsp;</td>
</tr>
<tr bgcolor="#FFFFFF">
  <td align="right" width="18%"><span class="STYLE1">*</span>�������</td> 
  <td width="32%"><input type="text" name="sjcj" size="20" maxlength="17"  value="<%=sjcj%>" ></td>
  <td align="right" width="18%"><span class="STYLE1">*</span><span class="STYLE2">�����շѽ��</span></td> 
  <td width="32%"><input type="text" name="sjsfje" size="20" maxlength="17"  value="<%=sjsfje%>" readonly></td>
</tr>
</table>
<BR>
��ѡ�������б��������۲���ȷ�����޸�
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="6%">���ۼ���</td>
	<td  width="6%">������λ</td>
	<td  width="6%">����</td>
	<td  width="6%">����</td>
	<td  width="10%"><span class="STYLE2"><span class="STYLE1">*</span>�����</span></td>
	<td  width="10%">��Ʒ����</td>
	<td  width="14%">��Ʒ����</td>
	<td  width="10%">Ʒ��</td>
	<td  width="16%">�ͺ�</td>
	<td  width="16%">���</td>
</tr>
<%
	String sxh=null;
	String bjjbmc=null;
	double sl=0;
	double dj=0;
	double jsj=0;
	String cpbm=null;
	String cpmc=null;
	String ppmc=null;
	String xh=null;
	String gg=null;
//	String jldw=null;

	ls_sql="SELECT bj_khzcxm.sxh,bjjbmc,bj_khzcxm.sl,bj_khzcxm.dj,bj_khzcxm.jsj,bj_khzcxm.cpbm,bj_khzcxm.cpmc,bj_khzcxm.ppmc,bj_khzcxm.xh,bj_khzcxm.gg,bj_khzcxm.jldw ";
	ls_sql+=" FROM jxc_cldlbm,jxc_clxlbm,bdm_bjjbbm,bj_khzcxm  ";
    ls_sql+=" where bj_khzcxm.tccpdlbm=jxc_cldlbm.cldlbm(+) and bj_khzcxm.tccplbbm=jxc_clxlbm.clxlbm(+)";
    ls_sql+=" and bj_khzcxm.bjjbbm=bdm_bjjbbm.bjjbbm(+)";
    ls_sql+=" and bj_khzcxm.zclx in('1','2')";//�������� 1���ײ��ڣ�2���ײ��⣻3�������ײ��ڣ�4�������ײ���
	ls_sql+=" and  (bj_khzcxm.khbh='"+wherekhbh+"') and  (bj_khzcxm.jgwzbm='"+wherejgwzbm+"') and  (bj_khzcxm.tccplbbm="+wheretccplbbm+")  ";
    ls_sql+=" order by bj_khzcxm.cpbm,bj_khzcxm.sxh";
//	out.println(ls_sql);
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		sxh=cf.fillNull(rs.getString("sxh"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));
		sl=rs.getDouble("sl");
		dj=rs.getDouble("dj");
		jsj=rs.getDouble("jsj");
		cpbm=cf.fillNull(rs.getString("cpbm"));
		cpmc=cf.fillNull(rs.getString("cpmc"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldw=cf.fillNull(rs.getString("jldw"));

		%>
		<tr bgcolor="#FFFFFF"  align="center">
			<td><%=bjjbmc%></td>
			<td><%=jldw%></td>
			<td><%=sl%></td>
			<td><%=dj%></td>
			<td>
				<input type="hidden" name="sxh" value="<%=sxh%>">
				<input type="text" name="jsj" value="<%=jsj%>" size="11" maxlength="11" style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid" ></td>
			</td>
			<td><%=cpbm%></td>
			<td><%=cpmc%></td>
			<td><%=ppmc%></td>
			<td><%=xh%></td>
			<td><%=gg%></td>
		</tr>
		<%
	}
	rs.close();
	ps.close();


%>
</table>

<BR>
<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#CCCCCC" style='FONT-SIZE: 12px'>
    <tr> 
      <td colspan="4" >
	<div align="center">
		<input type="hidden" name="wherekhbh"  value="<%=wherekhbh%>" >
		<input type="hidden" name="wherejgwzbm"  value="<%=wherejgwzbm%>" >
		<input type="hidden" name="wheretccplbbm"  value="<%=wheretccplbbm%>" >
	  <input type="button"  value="����" onClick="f_do(editform)">
	  <input type="reset"  value="����">
	</div>      </td>
    </tr>
  </table>
</form>
</body>
</html>

<%
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
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>


<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//����FormName:Form������
{


	if(	!radioChecked(FormName.sjsfycx)) {
		alert("��ѡ��[�����Ƿ��д���]��");
		FormName.sjsfycx[0].focus();
		return false;
	}



	if(	javaTrim(FormName.sjsfsl)=="") {
		alert("������[�����շ�����]��");
		FormName.sjsfsl.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfsl, "�����շ�����"))) {
		return false;
	}
	if(	javaTrim(FormName.sjcj)=="") {
		alert("������[�������]��");
		FormName.sjcj.focus();
		return false;
	}
	if(!(isFloat(FormName.sjcj, "�������"))) {
		return false;
	}

	FormName.sjsfje.value=FormName.sjsfsl.value*FormName.sjcj.value;

	if(	javaTrim(FormName.sjsfje)=="") {
		alert("������[�����շѽ��]��");
		FormName.sjsfje.focus();
		return false;
	}
	if(!(isFloat(FormName.sjsfje, "�����շѽ��"))) {
		return false;
	}
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
