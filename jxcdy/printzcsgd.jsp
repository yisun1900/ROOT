<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%

String sgph=cf.GB2Uni(request.getParameter("sgph"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps2=null;
ResultSet rs2=null;
//�ܲ�
String dwbh="&nbsp;";//��λ���
String dwmc="&nbsp;";//��λ����
String dh="&nbsp;";//�绰
String cz="&nbsp;";//����
String jbr="&nbsp;";//������
String jbrsj="&nbsp;";//�������ֻ�
String shr="&nbsp;";//�ջ���
String shrsj="&nbsp;";//�ջ����ֻ�
String fzr="&nbsp;";//������
String fzrsj="&nbsp;";//�������ֻ�
String dz="&nbsp;";//��ַ
String khyh="&nbsp;";//��������
String zh="&nbsp;";//�˺�
String khrxm="&nbsp;";//����������
String sm1="&nbsp;";//˵��1
String sm2="&nbsp;";//˵��2
String khyh1="&nbsp;";//��������
String zh1="&nbsp;";//�˺�
String khrxm1="&nbsp;";//����������
String khyh2="&nbsp;";//��������
String zh2="&nbsp;";//�˺�
String khrxm2="&nbsp;";//����������
//�ֹ�˾
String fgsdwbh="&nbsp;";//��λ���
String fgsdwmc="&nbsp;";//��λ����
String fgsdh="&nbsp;";//�绰
String fgscz="&nbsp;";//����
String fgsjbr="&nbsp;";//������
String fgsjbrsj="&nbsp;";//�������ֻ�
String fgsshr="&nbsp;";//�ջ���
String fgsshrsj="&nbsp;";//�ջ����ֻ�
String fgsfzr="&nbsp;";//������
String fgsfzrsj="&nbsp;";//�������ֻ�
String fgsdz="&nbsp;";//��ַ
String fgskhyh="&nbsp;";//��������
String fgszh="&nbsp;";//�˺�
String fgskhrxm="&nbsp;";//����������
String fgssm1="&nbsp;";//˵��1
String fgssm2="&nbsp;";//˵��2
//�����깺����ע
String bz="&nbsp;";
String dqbm=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
	//��ѯ�ܲ���ӡ����
	ls_sql="select jxc_fgslxr.dwmc dwmc,dh,cz,jbr,jbrsj,jxc_fgslxr.shr shr,shrsj,fzr,fzrsj,dz,khyh,zh,khrxm,sm1,sm2,dqbm,khyh1,zh1,khrxm1,khyh2,zh2,khrxm2 ";
	ls_sql+=" from  jxc_fgslxr,sq_dwxx ";
	ls_sql+=" where jxc_fgslxr.dwbh='99999' and jxc_fgslxr.dwbh=sq_dwxx.dwbh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dh=cf.fillNull(rs.getString("dh"));
		cz=cf.fillNull(rs.getString("cz"));
		jbr=cf.fillNull(rs.getString("jbr"));
		jbrsj=cf.fillNull(rs.getString("jbrsj"));
		shr=cf.fillNull(rs.getString("shr"));
		shrsj=cf.fillNull(rs.getString("shrsj"));
		fzr=cf.fillNull(rs.getString("fzr"));
		fzrsj=cf.fillNull(rs.getString("fzrsj"));
		dz=cf.fillNull(rs.getString("dz"));
		khyh=cf.fillNull(rs.getString("khyh"));
		zh=cf.fillNull(rs.getString("zh"));
		khrxm=cf.fillNull(rs.getString("khrxm"));
		sm1=cf.fillNull(rs.getString("sm1"));
		sm2=cf.fillNull(rs.getString("sm2"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		khyh1=cf.fillNull(rs.getString("khyh1"));
		zh1=cf.fillNull(rs.getString("zh1"));
		khrxm1=cf.fillNull(rs.getString("khrxm1"));
		khyh2=cf.fillNull(rs.getString("khyh2"));
		zh2=cf.fillNull(rs.getString("zh2"));
		khrxm2=cf.fillNull(rs.getString("khrxm2"));
	}
	rs.close();
	ps.close();

	//��ѯ�ֹ�˾��ӡ����
	ls_sql="select dwmc,dh,cz,jbr,jbrsj,jxc_fgslxr.shr shr,shrsj,fzr,fzrsj,dz,khyh,zh,khrxm,sm1,sm2,bz ";
	ls_sql+=" from  jxc_fgslxr,jxc_clsgd ";
	ls_sql+=" where jxc_fgslxr.dwbh=jxc_clsgd.ssfgs and  (sgph='"+sgph+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		fgsdwmc=cf.fillNull(rs.getString("dwmc"));
		fgsdh=cf.fillNull(rs.getString("dh"));
		fgscz=cf.fillNull(rs.getString("cz"));
		fgsjbr=cf.fillNull(rs.getString("jbr"));
		fgsjbrsj=cf.fillNull(rs.getString("jbrsj"));
		fgsshr=cf.fillNull(rs.getString("shr"));
		fgsshrsj=cf.fillNull(rs.getString("shrsj"));
		fgsfzr=cf.fillNull(rs.getString("fzr"));
		fgsfzrsj=cf.fillNull(rs.getString("fzrsj"));
		fgsdz=cf.fillNull(rs.getString("dz"));
		fgskhyh=cf.fillNull(rs.getString("khyh"));
		fgszh=cf.fillNull(rs.getString("zh"));
		fgskhrxm=cf.fillNull(rs.getString("khrxm"));
		fgssm1=cf.fillNull(rs.getString("sm1"));
		fgssm2=cf.fillNull(rs.getString("sm2"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	else
	{
//		out.print("<font color=red>��û��¼��ֹ�˾��ϵ�ˣ�</font>");return;
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
	if (ps!= null) ps.close(); 
	if (conn != null) cf.close(conn); 
	}
catch (Exception e){
	if (conn != null) cf.close(conn); 
	}
}
%>
<body  style='FONT-SIZE: 14px'>
<table width="100%" border="1" cellspacing="0" style="border-color: #000000 #000000 #FFFFFF #000000 ;border-style:solid"  style="FONT-SIZE: 14px">
  <tr width="25%" align="center" bgcolor="#FFFFFF"> 
    <td width="20%" rowspan="6"><img width="260px" src="/images/tubiao.jpg"></td>
    <td colspan="3"><strong>��Ʒ����</strong></td>
	<td width="10%" align="right"><strong>�����ţ�</strong> </td>
  <td colspan="2" align="left"> <strong><%=sgph%>&nbsp;</strong> </td>   </tr>
   <tr align="center" bgcolor="#FFFFFF"> 
    <td width="15%" align="right">��������</td>
	<td colspan="2" align="left"><%=dwmc%>&nbsp;</td>
    <td width="10%" align="right">�ջ�����</td>
    <td colspan="2" align="left"><%=fgsdwmc%>&nbsp;</td>
  </tr>
   <tr align="center" bgcolor="#FFFFFF"> 
    <td width="15%" align="right">�����ˣ�</td>
	<td colspan="2" align="left"><%=jbr%>&nbsp;</td>
    <td width="10%" align="right">�ջ��ˣ� </td>
    <td colspan="2" align="left"><%=fgsshr%>&nbsp;</td>
  </tr>
 <tr align="center" bgcolor="#FFFFFF"> 
    <td width="15%" align="right">�绰��</td>
	<td colspan="2" align="left"><%=dh%>&nbsp;</td>
    <td width="10%" align="right">�绰��</td>
    <td colspan="2" align="left"><%=fgsdh%>&nbsp;</td>
  </tr>
   <tr align="center" bgcolor="#FFFFFF"> 
    <td width="15%" align="right">���棺</td>
	<td colspan="2" align="left"><%=cz%>&nbsp;</td>
    <td width="10%" align="right">���棺</td>
    <td colspan="2" align="left"><%=fgscz%>&nbsp;</td>
  </tr>
   <tr align="center" bgcolor="#FFFFFF"> 
    <td width="15%" align="right">��ַ��</td>
	<td colspan="2" align="left"><%=dz%>&nbsp;</td>
    <td width="10%" align="right">��ַ��</td>
    <td colspan="2" align="left"><%=fgsdz%>&nbsp;</td>
  </tr>
</table>
<table width="100%" bgcolor="#000000"   border="1" cellspacing="0" style="border-color: #FFFFFF #000000 #000000 #000000 ;border-style:solid"  style="FONT-SIZE: 14px">
 <tr align="center" bgcolor="#FFFFFF"> 
    <td width="31%"><b>��Ʒ����</b></td>
    <td width="23%"><b>����ͺ�</b></td>
	<td width="10%"><b>��λ</b></td>
    <td width="9%"><b>����</b></td>
    <td width="12%"><b>���ۣ�Ԫ��</b></td>
	<td width="13%"><b>�ܼۣ�Ԫ��</b></td>
 </tr>
 <%
 String clmc=null;
 String xh=null;
 String gg=null;
 String jldwbm=null;
 String xszl=null;
 double shsl=0;
 double dfgsjg=0;
 double zjg=0;
 double zzl=0;
 double sumzsl=0;
 double sumzzl=0;
 double sumzjg=0;
 try {
	conn=cf.getConnection();
	//��ѯ��Ʒ��ϸ��Ϣ
	ls_sql="select clmc,xh,gg,jldwbm,shsl,shjg,shje";
	ls_sql+=" from jxc_clsgmx ";
	ls_sql+=" where jxc_clsgmx.sgph='"+sgph+"'";
	ls_sql+=" order by sgxh ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	while (rs.next())
	{
		clmc=cf.fillNull(rs.getString("clmc"));
		xh=cf.fillNull(rs.getString("xh"));
		gg=cf.fillNull(rs.getString("gg"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		shsl=rs.getDouble("shsl");
		dfgsjg=rs.getDouble("shjg");
		zjg=rs.getDouble("shje");

		sumzsl+=shsl;
		sumzjg+=zjg;
		sumzzl+=zzl;
		%>
		<tr align="center" bgcolor="#FFFFFF"> 
			<td ><%=clmc%>&nbsp;</td>
			<td><%=gg%>/<%=xh%>&nbsp;</td>
			<td ><%=jldwbm%>&nbsp;</td>
			<td ><%=shsl%>&nbsp;</td>
			<td ><%=dfgsjg%>&nbsp; </td>
			<td ><%=zjg%>&nbsp;</td>
		 </tr>
		<%
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
	if (ps!= null) ps.close(); 
	if (conn != null) cf.close(conn); 
	}
catch (Exception e){
	if (conn != null) cf.close(conn); 
	}
}
%>
   
   <tr align="center" bgcolor="#FFFFFF"> 
    <td align="right">С ��:</td>
    <td >&nbsp;</td>
    <td >&nbsp; </td>
    <td ><%=cf.formatDouble(sumzsl)%>&nbsp;</td>
    <td >&nbsp; </td>
	<td  ><%=cf.formatDouble(sumzjg)%>&nbsp; </td>
 </tr>
 <tr align="center" bgcolor="#FFFFFF"> 
    <td width="31%" align="right">���ϼƣ���д��</td>
    <td colspan="6" align="left"><%=cf.NumToRMBStr(sumzjg)%>&nbsp;   </td>
  </tr>
   <tr align="center" bgcolor="#FFFFFF"> 
    <td width="31%" align="right">��ע��</td>
    <td colspan="6" align="left"><%=bz%>&nbsp;</td>
  </tr>
</table>
<table width="100%" bgcolor="#000000"   border="1" cellspacing="0" style="border-color: #FFFFFF #000000 #000000 #000000 ;border-style:solid"  style="FONT-SIZE: 14px">
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="3" align="left"><p>�Ⲻ��˾�ɹ�����ǩ�֣�</p>
    <p>ǩ�����ڣ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</p></td>
    <td colspan="3" align="left"><p>�Ⲻ��˾�ܾ���ǩ�֣�</p>
    <p>ǩ�����ڣ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</p></td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="6" align="left"><strong>����֧����ʽ���뾡�콫������������˺ţ���󷢻���</strong></td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td width="13%" align="right">�˺ţ�</td>
    <td width="28%" align="left"><%=zh%>&nbsp;</td>
    <td width="10%" align="right">�����У�</td>
    <td width="23%" align="left"><%=khyh%>&nbsp;</td>
    <td width="7%" align="right">������</td>
    <td width="19%" align="left"><%=khrxm%>&nbsp;</td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td width="13%" align="right">�˺ţ�</td>
    <td width="28%" align="left"><%=zh1%>&nbsp;</td>
    <td width="10%" align="right">�����У�</td>
    <td width="23%" align="left"><%=khyh1%>&nbsp;</td>
    <td width="7%" align="right">������</td>
    <td width="19%" align="left"><%=khrxm1%>&nbsp;</td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td width="13%" align="right">�˺ţ�</td>
    <td width="28%" align="left"><%=zh2%>&nbsp;</td>
    <td width="10%" align="right">�����У�</td>
    <td width="23%" align="left"><%=khyh2%>&nbsp;</td>
    <td width="7%" align="right">������</td>
    <td width="19%" align="left"><%=khrxm2%>&nbsp;</td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="2" align="left"><strong>�˷�֧����ʽ����������</strong></td>
    <td colspan="2" align="left"><strong>�˷ѽ�</strong></td>
    <td colspan="2" align="left">Ԥ�Ƶ������ڣ�
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;����ǰ</td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="6" align="center">�����ɲɹ�����д</td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="3" align="left">�����Ƿ��յ���&nbsp;&nbsp;<input name="1" type="checkbox" value="1" />��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="12" type="checkbox" value="1" />�� </td>
    <td colspan="3" rowspan="2" align="left"><p>�ɹ�������ǩ�֣�</p>
    <p>ǩ�����ڣ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</p></td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="3" align="left"><p>�ɹ���������Աǩ�֣�</p>
    <p>ǩ�����ڣ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��&nbsp;&nbsp;&nbsp;&nbsp;��</p></td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="6" align="left"><%=sm1%>&nbsp;</td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF"> 
    <td colspan="6" align="left"><%=sm2%>&nbsp;</td>
  </tr>
</table>
</body>