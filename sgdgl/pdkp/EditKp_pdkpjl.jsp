<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>¼������</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<%

String kpjlh=null;
String fgsbh=null;
String qssj=null;
String jzsj=null;
int kxsgds=0;
double sgdpdze=0;
double ajqz=0;
double bjqz=0;
double cjqz=0;
double djqz=0;
double ajddbl=0;
double ajzdbl=0;
double ajxdbl=0;
double bjddbl=0;
double bjzdbl=0;
double bjxdbl=0;
double cjddbl=0;
double cjzdbl=0;
double cjxdbl=0;
double djddbl=0;
double djzdbl=0;
double djxdbl=0;
double ajzdjde=0;
double bjzdjde=0;
double cjzdjde=0;
double djzdjde=0;
int sgdpkzf=0;
double mfkjde=0;

double zsdpdze=0;
double zsajqz=0;
double zsbjqz=0;
double zscjqz=0;
double zsdjqz=0;
double zsajddbl=0;
double zsajzdbl=0;
double zsajxdbl=0;
double zsbjddbl=0;
double zsbjzdbl=0;
double zsbjxdbl=0;
double zscjddbl=0;
double zscjzdbl=0;
double zscjxdbl=0;
double zsdjddbl=0;
double zsdjzdbl=0;
double zsdjxdbl=0;
double zsajzdjde=0;
double zsbjzdjde=0;
double zscjzdjde=0;
double zsdjzdjde=0;

int zsdkpzf=0;
double zsmfkjde=0;

String lrr=null;
String lrsj=null;
String zxbz=null;
String bz=null;
String wherekpjlh=cf.GB2Uni(request.getParameter("kpjlh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select kpjlh,fgsbh,qssj,jzsj,kxsgds,sgdpdze,ajqz,bjqz,cjqz,djqz,ajddbl,ajzdbl,ajxdbl,bjddbl,bjzdbl,bjxdbl,cjddbl,cjzdbl,cjxdbl,djddbl,djzdbl,djxdbl,ajzdjde,bjzdjde,cjzdjde,djzdjde,sgdpkzf,mfkjde    ,zsdpdze,zsajqz,zsbjqz,zscjqz,zsdjqz,zsajddbl,zsajzdbl,zsajxdbl,zsbjddbl,zsbjzdbl,zsbjxdbl,zscjddbl,zscjzdbl,zscjxdbl,zsdjddbl,zsdjzdbl,zsdjxdbl,zsajzdjde,zsbjzdjde,zscjzdjde,zsdjzdjde   ,zsdkpzf,zsmfkjde,lrr,lrsj,zxbz,bz ";
	ls_sql+=" from  kp_pdkpjl";
	ls_sql+=" where kpjlh='"+wherekpjlh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		kpjlh=cf.fillNull(rs.getString("kpjlh"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		qssj=cf.fillNull(rs.getDate("qssj"));
		jzsj=cf.fillNull(rs.getDate("jzsj"));
		kxsgds=rs.getInt("kxsgds");
		sgdpdze=rs.getDouble("sgdpdze");
		ajqz=rs.getDouble("ajqz");
		bjqz=rs.getDouble("bjqz");
		cjqz=rs.getDouble("cjqz");
		djqz=rs.getDouble("djqz");
		ajddbl=rs.getDouble("ajddbl");
		ajzdbl=rs.getDouble("ajzdbl");
		ajxdbl=rs.getDouble("ajxdbl");
		bjddbl=rs.getDouble("bjddbl");
		bjzdbl=rs.getDouble("bjzdbl");
		bjxdbl=rs.getDouble("bjxdbl");
		cjddbl=rs.getDouble("cjddbl");
		cjzdbl=rs.getDouble("cjzdbl");
		cjxdbl=rs.getDouble("cjxdbl");
		djddbl=rs.getDouble("djddbl");
		djzdbl=rs.getDouble("djzdbl");
		djxdbl=rs.getDouble("djxdbl");
		ajzdjde=rs.getDouble("ajzdjde");
		bjzdjde=rs.getDouble("bjzdjde");
		cjzdjde=rs.getDouble("cjzdjde");
		djzdjde=rs.getDouble("djzdjde");
		sgdpkzf=rs.getInt("sgdpkzf");
		mfkjde=rs.getDouble("mfkjde");

		zsdpdze=rs.getDouble("zsdpdze");
		zsajqz=rs.getDouble("zsajqz");
		zsbjqz=rs.getDouble("zsbjqz");
		zscjqz=rs.getDouble("zscjqz");
		zsdjqz=rs.getDouble("zsdjqz");
		zsajddbl=rs.getDouble("zsajddbl");
		zsajzdbl=rs.getDouble("zsajzdbl");
		zsajxdbl=rs.getDouble("zsajxdbl");
		zsbjddbl=rs.getDouble("zsbjddbl");
		zsbjzdbl=rs.getDouble("zsbjzdbl");
		zsbjxdbl=rs.getDouble("zsbjxdbl");
		zscjddbl=rs.getDouble("zscjddbl");
		zscjzdbl=rs.getDouble("zscjzdbl");
		zscjxdbl=rs.getDouble("zscjxdbl");
		zsdjddbl=rs.getDouble("zsdjddbl");
		zsdjzdbl=rs.getDouble("zsdjzdbl");
		zsdjxdbl=rs.getDouble("zsdjxdbl");
		zsajzdjde=rs.getDouble("zsajzdjde");
		zsbjzdjde=rs.getDouble("zsbjzdjde");
		zscjzdjde=rs.getDouble("zscjzdjde");
		zsdjzdjde=rs.getDouble("zsdjzdjde");

		zsdkpzf=rs.getInt("zsdkpzf");
		zsmfkjde=rs.getDouble("zsmfkjde");
		lrr=cf.fillNull(rs.getString("lrr"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		zxbz=cf.fillNull(rs.getString("zxbz"));
		bz=cf.fillNull(rs.getString("bz"));
	}
	rs.close();
	ps.close();

	if (!zxbz.equals("Y"))
	{
		out.println("����ֻ���޸����µĿ�����¼");
		return;
	}
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

<body bgcolor="#FFFFFF">
<form method="post" action="" name="insertform" target="_blank">
  <div align="center">ʩ�����ɵ�������¼��<font color="#0000CC">������¼�ţ�<%=kpjlh%></font>��</div>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%" bgcolor="#FFFFFF"><font color="#FF0000">*</font>�ֹ�˾</td>
      <td width="32%"> 
		<input type="hidden" name="kpjlh" value="<%=kpjlh%>" size="20" maxlength="9" readonly>
        <select name="fgsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
          <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%> 
        </select>
      </td>
      <td align="right" width="21%"><font color="#FF0000">*</font>�ɵ�ʱ��ѡʩ������</td>
      <td width="29%"> 
        <input type="text" name="kxsgds" value="<%=kxsgds%>" size="20" maxlength="17" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font>������ʼʱ��</td>
      <td width="32%"> 
		<input type="text" name="qssj" value="<%=qssj%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
      <td align="right" width="21%"><font color="#FF0000">*</font>������ֹʱ��</td>
      <td width="29%"> 
        <input type="text" name="jzsj" value="<%=jzsj%>" size="20" maxlength="10" ondblclick="JSCalendar(this)">
      </td>
    </tr>
    <tr bgcolor="#FFFFFF">
      <td align="right" width="18%"><font color="#FF0000">*</font>��ֱ�����ɵ��ܶ�</td>
      <td width="32%"> 
        <input type="text" name="sgdpdze" value="<%=sgdpdze%>" size="20" maxlength="17" >
        �� </td>
      <td align="right" width="21%"><font color="#FF0000">*</font>ֱ�����ɵ��ܶ�</td>
      <td width="29%"> 
        <input type="text" name="zsdpdze" value="<%=zsdpdze%>" size="20" maxlength="17" >
        �� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%"><font color="#FF0000">*</font><font color="#0000CC">¼����</font></td>
      <td width="32%"> 
		<input type="text" name="lrr" value="<%=lrr%>" size="20" maxlength="20" readonly>
      </td>
      <td align="right" width="21%"><font color="#FF0000">*</font><font color="#0000CC">¼��ʱ��</font></td>
      <td width="29%"> 
        <input type="text" name="lrsj" value="<%=lrsj%>" size="20" maxlength="10" readonly>
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="18%">��ע</td>
      <td colspan="3"> 
        <textarea name="bz" cols="75" rows="2"><%=bz%></textarea>
      </td>
    </tr>
  </table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF" align="center"> 
      <td colspan="8" height="21"><b>��ֱ����</b></td>
    </tr>
    <tr bgcolor="#FFFFFF" align="center"> 
      <td height="26" colspan="2" bgcolor="#E8E8FF"><b>A����</b></td>
      <td height="26" colspan="2" bgcolor="#FFFFCC"><b>B����</b></td>
      <td height="26" colspan="2" bgcolor="#E8E8FF"><b>C����</b></td>
      <td colspan="2" height="26" bgcolor="#FFFFCC"><b>D����</b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">Ȩ��</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="ajqz" value="<%=ajqz%>" size="8" maxlength="9" >
      </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">Ȩ��</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="bjqz" value="<%=bjqz%>" size="8" maxlength="9" >
      </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">Ȩ��</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="cjqz" value="<%=cjqz%>" size="8" maxlength="9" >
      </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">Ȩ��</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="djqz" value="<%=djqz%>" size="8" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">���ӵ���</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="ajzdjde" value="<%=ajzdjde%>" size="8" maxlength="17" >
        �� </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">���ӵ���</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="bjzdjde" value="<%=bjzdjde%>" size="8" maxlength="17" >
        �� </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">���ӵ���</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="cjzdjde" value="<%=cjzdjde%>" size="8" maxlength="17" >
        �� </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">���ӵ���</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="djzdjde" value="<%=djzdjde%>" size="8" maxlength="17" >
        �� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">�Ӵ󵥱���</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="ajddbl" value="<%=ajddbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">�Ӵ󵥱���</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="bjddbl" value="<%=bjddbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">�Ӵ󵥱���</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="cjddbl" value="<%=cjddbl%>" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">�Ӵ󵥱���</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="djddbl" value="<%=djddbl%>" size="8" maxlength="9" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">���е�����</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="ajzdbl" value="<%=ajzdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">���е�����</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="bjzdbl" value="<%=bjzdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">���е�����</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="cjzdbl" value="<%=cjzdbl%>" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">���е�����</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="djzdbl" value="<%=djzdbl%>" size="8" maxlength="9" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">��С������</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="ajxdbl" value="<%=ajxdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">��С������</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="bjxdbl" value="<%=bjxdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">��С������</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="cjxdbl" value="<%=cjxdbl%>" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">��С������</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="djxdbl" value="<%=djxdbl%>" size="8" maxlength="9" >
        % </td>
    </tr>
  </table>
  <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
    <tr bgcolor="#FFFFFF"> 
      <td height="24" colspan="8" align="center"><b>ֱ����</b></td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">Ȩ��</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zsajqz" value="<%=zsajqz%>" size="8" maxlength="9" >
      </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">Ȩ��</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsbjqz" value="<%=zsbjqz%>" size="8" maxlength="9" >
      </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">Ȩ��</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zscjqz" value="<%=zscjqz%>" size="8" maxlength="9" >
      </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">Ȩ��</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsdjqz" value="<%=zsdjqz%>" size="8" maxlength="9" >
      </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">���ӵ���</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zsajzdjde" value="<%=zsajzdjde%>" size="8" maxlength="17" >
        �� </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">���ӵ���</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsbjzdjde" value="<%=zsbjzdjde%>" size="8" maxlength="17" >
        �� </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">���ӵ���</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zscjzdjde" value="<%=zscjzdjde%>" size="8" maxlength="17" >
        �� </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">���ӵ���</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsdjzdjde" value="<%=zsdjzdjde%>" size="8" maxlength="17" >
        �� </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">�Ӵ󵥱���</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zsajddbl" value="<%=zsajddbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">�Ӵ󵥱���</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsbjddbl" value="<%=zsbjddbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">�Ӵ󵥱���</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zscjddbl" value="<%=zscjddbl%>" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">�Ӵ󵥱���</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsdjddbl" value="<%=zsdjddbl%>" size="8" maxlength="9" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">���е�����</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zsajzdbl" value="<%=zsajzdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">���е�����</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsbjzdbl" value="<%=zsbjzdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">���е�����</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zscjzdbl" value="<%=zscjzdbl%>" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">���е�����</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsdjzdbl" value="<%=zsdjzdbl%>" size="8" maxlength="9" >
        % </td>
    </tr>
    <tr bgcolor="#FFFFFF"> 
      <td align="right" width="12%" bgcolor="#E8E8FF">��С������</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zsajxdbl" value="<%=zsajxdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#FFFFCC">��С������</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsbjxdbl" value="<%=zsbjxdbl%>" size="8" maxlength="9" >
        % </td>
      <td align="right" width="12%" bgcolor="#E8E8FF">��С������</td>
      <td width="13%" bgcolor="#E8E8FF"> 
        <input type="text" name="zscjxdbl" value="<%=zscjxdbl%>" size="8" maxlength="9" >
        % </td>
      <td width="12%" align="right" bgcolor="#FFFFCC">��С������</td>
      <td width="13%" bgcolor="#FFFFCC"> 
        <input type="text" name="zsdjxdbl" value="<%=zsdjxdbl%>" size="8" maxlength="9" >
        % </td>
    </tr>
    <tr> 
      <td colspan="8" align="center"> 
        <input type="button"  value="�޸Ŀ�������" onClick="f_do(insertform)">
        <input type="button"  value="���������" onClick="f_kp(insertform)" name="kp" >
        <input type="button"  value="�鿴�������" onClick="f_ckkp(insertform)" name="ck" >
        <input type="reset"  value="����" name="reset">
      </td>
    </tr>
  </table>

	<BR>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
	<td  width="9%">��¼��</td>
	<td  width="11%">�ֹ�˾</td>
	<td  width="10%">��ʼʱ��</td>
	<td  width="10%">��ֹʱ��</td>
	<td  width="11%">��ֱ���ɵ���</td>
	<td  width="11%">ֱ�����ɵ���</td>
	<td  width="7%">¼����</td>
	<td  width="10%">¼��ʱ��</td>
	<td  width="21%">��ע</td>
	</tr>
<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT kpjlh,dwmc,qssj,jzsj,sgdpdze,zsdpdze,lrr,lrsj,kp_pdkpjl.bz  ";
	ls_sql+=" FROM kp_pdkpjl,sq_dwxx  ";
    ls_sql+=" where (kp_pdkpjl.fgsbh=sq_dwxx.dwbh(+))";
	ls_sql+=" and  fgsbh='"+fgsbh+"'";
    ls_sql+=" order by kpjlh desc";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(400);//����ÿҳ��ʾ��¼��


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"xjjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewKp_xjgdjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("xjjlh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
%> 
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
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("������[������¼��]��");
		FormName.kpjlh.focus();
		return false;
	}

	if(	javaTrim(FormName.fgsbh)=="") {
		alert("��ѡ��[�ֹ�˾]��");
		FormName.fgsbh.focus();
		return false;
	}
	if(	javaTrim(FormName.kxsgds)=="") {
		alert("������[�ɵ�ʱ��ѡʩ������]��");
		FormName.kxsgds.focus();
		return false;
	}
	if(!(isNumber(FormName.kxsgds, "�ɵ�ʱ��ѡʩ������"))) {
		return false;
	}
	if(	javaTrim(FormName.qssj)=="") {
		alert("������[������ʼʱ��]��");
		FormName.qssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qssj, "������ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("������[������ֹʱ��]��");
		FormName.jzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "������ֹʱ��"))) {
		return false;
	}

	if(	javaTrim(FormName.sgdpdze)=="") {
		alert("������[��ֱ�����ɵ��ܶ�]��");
		FormName.sgdpdze.focus();
		return false;
	}
	if(!(isFloat(FormName.sgdpdze, "��ֱ�����ɵ��ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.zsdpdze)=="") {
		alert("������[ֱ�����ɵ��ܶ�]��");
		FormName.zsdpdze.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdpdze, "ֱ�����ɵ��ܶ�"))) {
		return false;
	}
	if(	javaTrim(FormName.lrr)=="") {
		alert("������[¼����]��");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("������[¼��ʱ��]��");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "¼��ʱ��"))) {
		return false;
	}



	if(	javaTrim(FormName.ajqz)=="") {
		alert("������[A����Ȩ��]��");
		FormName.ajqz.focus();
		return false;
	}
	if(!(isFloat(FormName.ajqz, "A����Ȩ��"))) {
		return false;
	}
	if(	javaTrim(FormName.bjqz)=="") {
		alert("������[B����Ȩ��]��");
		FormName.bjqz.focus();
		return false;
	}
	if(!(isFloat(FormName.bjqz, "B����Ȩ��"))) {
		return false;
	}
	if(	javaTrim(FormName.cjqz)=="") {
		alert("������[C����Ȩ��]��");
		FormName.cjqz.focus();
		return false;
	}
	if(!(isFloat(FormName.cjqz, "C����Ȩ��"))) {
		return false;
	}
	if(	javaTrim(FormName.djqz)=="") {
		alert("������[D����Ȩ��]��");
		FormName.djqz.focus();
		return false;
	}
	if(!(isFloat(FormName.djqz, "D����Ȩ��"))) {
		return false;
	}
	if(	javaTrim(FormName.ajddbl)=="") {
		alert("������[A���ӽӴ󵥱���]��");
		FormName.ajddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ajddbl, "A���ӽӴ󵥱���"))) {
		return false;
	}
	if(	javaTrim(FormName.ajzdbl)=="") {
		alert("������[A���ӽ��е�����]��");
		FormName.ajzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ajzdbl, "A���ӽ��е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.ajxdbl)=="") {
		alert("������[A���ӽ�С������]��");
		FormName.ajxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.ajxdbl, "A���ӽ�С������"))) {
		return false;
	}
	if(	javaTrim(FormName.bjddbl)=="") {
		alert("������[B���ӽӴ󵥱���]��");
		FormName.bjddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bjddbl, "B���ӽӴ󵥱���"))) {
		return false;
	}
	if(	javaTrim(FormName.bjzdbl)=="") {
		alert("������[B���ӽ��е�����]��");
		FormName.bjzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bjzdbl, "B���ӽ��е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.bjxdbl)=="") {
		alert("������[B���ӽ�С������]��");
		FormName.bjxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.bjxdbl, "B���ӽ�С������"))) {
		return false;
	}
	if(	javaTrim(FormName.cjddbl)=="") {
		alert("������[C���ӽӴ󵥱���]��");
		FormName.cjddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cjddbl, "C���ӽӴ󵥱���"))) {
		return false;
	}
	if(	javaTrim(FormName.cjzdbl)=="") {
		alert("������[C���ӽ��е�����]��");
		FormName.cjzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cjzdbl, "C���ӽ��е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.cjxdbl)=="") {
		alert("������[C���ӽ�С������]��");
		FormName.cjxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.cjxdbl, "C���ӽ�С������"))) {
		return false;
	}
	if(	javaTrim(FormName.djddbl)=="") {
		alert("������[D���ӽӴ󵥱���]��");
		FormName.djddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.djddbl, "D���ӽӴ󵥱���"))) {
		return false;
	}
	if(	javaTrim(FormName.djzdbl)=="") {
		alert("������[D���ӽ��е�����]��");
		FormName.djzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.djzdbl, "D���ӽ��е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.djxdbl)=="") {
		alert("������[D���ӽ�С������]��");
		FormName.djxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.djxdbl, "D���ӽ�С������"))) {
		return false;
	}
	if(	javaTrim(FormName.ajzdjde)=="") {
		alert("������[A���ӵ������ӵ���]��");
		FormName.ajzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.ajzdjde, "A���ӵ������ӵ���"))) {
		return false;
	}
	if(	javaTrim(FormName.bjzdjde)=="") {
		alert("������[B���ӵ������ӵ���]��");
		FormName.bjzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.bjzdjde, "B���ӵ������ӵ���"))) {
		return false;
	}
	if(	javaTrim(FormName.cjzdjde)=="") {
		alert("������[C���ӵ������ӵ���]��");
		FormName.cjzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.cjzdjde, "C���ӵ������ӵ���"))) {
		return false;
	}
	if(	javaTrim(FormName.djzdjde)=="") {
		alert("������[D���ӵ������ӵ���]��");
		FormName.djzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.djzdjde, "D���ӵ������ӵ���"))) {
		return false;
	}



	if(	javaTrim(FormName.zsajqz)=="") {
		alert("������[ֱ��A����Ȩ��]��");
		FormName.zsajqz.focus();
		return false;
	}
	if(!(isFloat(FormName.zsajqz, "ֱ��A����Ȩ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbjqz)=="") {
		alert("������[ֱ��B����Ȩ��]��");
		FormName.zsbjqz.focus();
		return false;
	}
	if(!(isFloat(FormName.zsbjqz, "ֱ��B����Ȩ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zscjqz)=="") {
		alert("������[ֱ��C����Ȩ��]��");
		FormName.zscjqz.focus();
		return false;
	}
	if(!(isFloat(FormName.zscjqz, "ֱ��C����Ȩ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zsdjqz)=="") {
		alert("������[ֱ��D����Ȩ��]��");
		FormName.zsdjqz.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdjqz, "ֱ��D����Ȩ��"))) {
		return false;
	}
	if(	javaTrim(FormName.zsajddbl)=="") {
		alert("������[ֱ��A���ӽӴ󵥱���]��");
		FormName.zsajddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsajddbl, "ֱ��A���ӽӴ󵥱���"))) {
		return false;
	}
	if(	javaTrim(FormName.zsajzdbl)=="") {
		alert("������[ֱ��A���ӽ��е�����]��");
		FormName.zsajzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsajzdbl, "ֱ��A���ӽ��е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.zsajxdbl)=="") {
		alert("������[ֱ��A���ӽ�С������]��");
		FormName.zsajxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsajxdbl, "ֱ��A���ӽ�С������"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbjddbl)=="") {
		alert("������[ֱ��B���ӽӴ󵥱���]��");
		FormName.zsbjddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsbjddbl, "ֱ��B���ӽӴ󵥱���"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbjzdbl)=="") {
		alert("������[ֱ��B���ӽ��е�����]��");
		FormName.zsbjzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsbjzdbl, "ֱ��B���ӽ��е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbjxdbl)=="") {
		alert("������[ֱ��B���ӽ�С������]��");
		FormName.zsbjxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsbjxdbl, "ֱ��B���ӽ�С������"))) {
		return false;
	}


	if(	javaTrim(FormName.zscjddbl)=="") {
		alert("������[ֱ��C���ӽӴ󵥱���]��");
		FormName.zscjddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zscjddbl, "ֱ��C���ӽӴ󵥱���"))) {
		return false;
	}
	if(	javaTrim(FormName.zscjzdbl)=="") {
		alert("������[ֱ��C���ӽ��е�����]��");
		FormName.zscjzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zscjzdbl, "ֱ��C���ӽ��е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.zscjxdbl)=="") {
		alert("������[ֱ��C���ӽ�С������]��");
		FormName.zscjxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zscjxdbl, "ֱ��C���ӽ�С������"))) {
		return false;
	}

	if(	javaTrim(FormName.zsdjddbl)=="") {
		alert("������[ֱ��D���ӽӴ󵥱���]��");
		FormName.zsdjddbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdjddbl, "ֱ��D���ӽӴ󵥱���"))) {
		return false;
	}
	if(	javaTrim(FormName.zsdjzdbl)=="") {
		alert("������[ֱ��D���ӽ��е�����]��");
		FormName.zsdjzdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdjzdbl, "ֱ��D���ӽ��е�����"))) {
		return false;
	}
	if(	javaTrim(FormName.zsdjxdbl)=="") {
		alert("������[ֱ��D���ӽ�С������]��");
		FormName.zsdjxdbl.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdjxdbl, "ֱ��D���ӽ�С������"))) {
		return false;
	}

	if(	javaTrim(FormName.zsajzdjde)=="") {
		alert("������[ֱ��A���ӵ������ӵ���]��");
		FormName.zsajzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.zsajzdjde, "ֱ��A���ӵ������ӵ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zsbjzdjde)=="") {
		alert("������[ֱ��B���ӵ������ӵ���]��");
		FormName.zsbjzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.zsbjzdjde, "ֱ��B���ӵ������ӵ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zscjzdjde)=="") {
		alert("������[ֱ��C���ӵ������ӵ���]��");
		FormName.zscjzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.zscjzdjde, "ֱ��C���ӵ������ӵ���"))) {
		return false;
	}
	if(	javaTrim(FormName.zsdjzdjde)=="") {
		alert("������[ֱ��D���ӵ������ӵ���]��");
		FormName.zsdjzdjde.focus();
		return false;
	}
	if(!(isFloat(FormName.zsdjzdjde, "ֱ��D���ӵ������ӵ���"))) {
		return false;
	}


	FormName.action="SaveEditKp_pdkpjl.jsp";
	FormName.submit();
	return true;
}

function f_kp(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("������[������¼��]��");
		FormName.kpjlh.focus();
		return false;
	}

	if(	javaTrim(FormName.qssj)=="") {
		alert("������[������ʼʱ��]��");
		FormName.qssj.focus();
		return false;
	}
	if(!(isDatetime(FormName.qssj, "������ʼʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.jzsj)=="") {
		alert("������[������ֹʱ��]��");
		FormName.jzsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.jzsj, "������ֹʱ��"))) {
		return false;
	}

	FormName.action="tjkpjg.jsp";
	FormName.submit();
	return true;
}
function f_ckkp(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.kpjlh)=="") {
		alert("������[������¼��]��");
		FormName.kpjlh.focus();
		return false;
	}

	FormName.action="ViewKp_pdkpmx.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
