<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
String zdyhbz=(String)session.getAttribute("zdyhbz");

String khbh=null;
String clgw=null;
String ztjjgw=null;
String ddshbz=null;
String kjxsj=null;
String xclbz=null;
String htshsj=null;
String xmzy=null;
String qhtsj=null;
String jhclsj=null;
String hkze=null;
String bz=null;
String ddbh=cf.GB2Uni(request.getParameter("ddbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String khxm=null;
String fwdz=null;
String lxfs=null;
String hth=null;
String sjs=null;
String qye=null;
String kgrq=null;
String jgrq=null;
String dmbh=null;
String dwmc=null;
String cxhdbm=null;

String zjxm=null;
String sgd=null;
String sgbz=null;
String qyrq=null;
String ssfgs=null;
String zcdlbm=null;
String zcxlbm=null;
String ppbm=null;


double zqclf=0;
double zhclf=0;
double zqzjxclf=0;
double zhzjxclf=0;
double cbze=0;
double zjxcbze=0;
double htjsbl=0;
double zjxjsbl=0;
double alljsbl=0;

String sqdj="";
String wdzje=null;
String htcxhdje=null;
String jjsjs="";

String lrsj=null;
String sfyyh=null;
String yhkssj=null;
String yhjzsj=null;
String yhnr=null;
String dzyy=null;
String sfjs=null;
String sxhtsfysh="";

double zczkl=0;
String listSql="";

try {
	conn=cf.getConnection();

	ls_sql="select sxhtsfysh,sfjs,zjxcbze,cbze,zqclf,zhclf,zqzjxclf,zhzjxclf,dzyy,lrsj,sfyyh,yhkssj,yhjzsj,yhnr,zczkl,jjsjs,htcxhdje,wdzje,zcdlbm,zcxlbm,ppbm,khbh,clgw,ztjjgw,ddshbz,kjxsj,xclbz,htshsj,xmzy,qhtsj,jhclsj,bz,hkze ";
	ls_sql+=" from  jc_zcdd";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sxhtsfysh=cf.fillNull(rs.getString("sxhtsfysh"));
		sfjs=cf.fillNull(rs.getString("sfjs"));
		zjxcbze=rs.getDouble("zjxcbze");
		cbze=rs.getDouble("cbze");
		zqclf=rs.getDouble("zqclf");
		zhclf=rs.getDouble("zhclf");
		zqzjxclf=rs.getDouble("zqzjxclf");
		zhzjxclf=rs.getDouble("zhzjxclf");

		dzyy=cf.fillNull(rs.getString("dzyy"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
		sfyyh=cf.fillNull(rs.getString("sfyyh"));
		yhkssj=cf.fillNull(rs.getDate("yhkssj"));
		yhjzsj=cf.fillNull(rs.getDate("yhjzsj"));
		yhnr=cf.fillNull(rs.getString("yhnr"));
		zczkl=rs.getDouble("zczkl");

		jjsjs=cf.fillNull(rs.getString("jjsjs"));
		htcxhdje=cf.fillNull(rs.getString("htcxhdje"));
		wdzje=cf.fillNull(rs.getString("wdzje"));
		zcdlbm=cf.fillNull(rs.getString("zcdlbm"));
		zcxlbm=cf.fillNull(rs.getString("zcxlbm"));
		ppbm=cf.fillNull(rs.getString("ppbm"));
		khbh=cf.fillNull(rs.getString("khbh"));
		clgw=cf.fillNull(rs.getString("clgw"));
		ztjjgw=cf.fillNull(rs.getString("ztjjgw"));
		ddshbz=cf.fillNull(rs.getString("ddshbz"));
		kjxsj=cf.fillNull(rs.getDate("kjxsj"));
		xclbz=cf.fillNull(rs.getString("xclbz"));
		htshsj=cf.fillNull(rs.getDate("htshsj"));
		xmzy=cf.fillNull(rs.getString("xmzy"));
		qhtsj=cf.fillNull(rs.getDate("qhtsj"));
		jhclsj=cf.fillNull(rs.getDate("jhclsj"));
		bz=cf.fillNull(rs.getString("bz"));
		hkze=cf.fillNull(rs.getString("hkze"));
	}
	rs.close();
	ps.close();

	if (!sfjs.equals("N") && !sfjs.equals("C"))//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M�����������
	{
		out.println("<BR>�����ѽ��㲻�����޸�");
		return;
	}

	if (!sxhtsfysh.equals("N"))
	{
		out.println("<BR>������д��ͬ�����");
		return;
	}


	String getzjxbh="";
	ls_sql="select zjxbh,sfjs";
	ls_sql+=" from jc_zczjx ";
	ls_sql+=" where ddbh='"+ddbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		getzjxbh=rs.getString(1);
		sfjs=cf.fillNull(rs.getString("sfjs"));

		if (!sfjs.equals("N") && !sfjs.equals("C"))//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M�����������
		{
			out.println("<BR>������������["+getzjxbh+"]�ѽ��㲻�����޸�");
			return;
		}
	}
	rs.close();
	ps.close();


	if (zhclf!=0)
	{
		htjsbl=cf.round(100-cbze*100/zhclf,2);
	}
	else{
		htjsbl=0;
	}
	if (zhzjxclf!=0)
	{
		zjxjsbl=cf.round(100-zjxcbze*100/zhzjxclf,2);
	}
	else{
		zjxjsbl=0;
	}
	if ((zhclf+zhzjxclf)!=0)
	{
		alljsbl=cf.round(100-(cbze+zjxcbze)*100/(zhclf+zhzjxclf),2);
	}
	else{
		alljsbl=0;
	}

	ls_sql="select khxm,fwdz,lxfs,hth,sjs,qye,kgrq,jgrq,fgsbh,crm_khxx.dwbh,dwmc,cxhdbm,zjxm,sgd,sgbz,qyrq";
	ls_sql+=" from  sq_dwxx,crm_khxx";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and  (crm_khxx.khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery(ls_sql);
	if (rs.next())
	{
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjs=cf.fillNull(rs.getString("sjs"));
		qye=cf.fillNull(rs.getString("qye"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
		dmbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));

		zjxm=cf.fillNull(rs.getString("zjxm"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qyrq=cf.fillNull(rs.getDate("qyrq"));
	}
	rs.close();
	ps.close();




%>

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body bgcolor="#FFFFFF">
<form method="post" action="" name="editform" target="_blank">

      <div align="center">�����д��Ŀ����ۣ�������ţ�<%=ddbh%>��</div>
<TABLE  bgcolor="#999999" cellpadding="0" cellspacing="0" border=1 width="270%" style='FONT-SIZE: 12px'>
<TR bgcolor="#CCCCCC"  align="center" > 
	<td  width="5%" >��������</td>
	<td  width="5%" >�ͺ�</td>
	<td  width="4%" >���</td>
	<td  width="3%" ><span class="STYLE1">���㵥��</span></td>
	<td  width="4%" >��д��ͬԭ��</td>
	<td  width="2%" bgcolor="#CC99FF" >����</td>
	<td  width="3%" >��ǰ����</td>
	<td  width="2%" >�ۿ�</td>
	<td  width="3%" >�ۺ󵥼�</td>
	<td  width="2%" bgcolor="#CC99FF" >��ɫ</td>
	<td  width="3%" bgcolor="#CC99FF" >��װλ��</td>
	<td  width="2%" >������λ</td>
	<td  width="3%" >��ǰ���Ϸ�</td>
	<td  width="3%" >�ۺ���Ϸ�</td>
	<td  width="3%" >Զ�̷�</td>
	<td  width="3%" >ѡ��������</td>
	<td  width="3%" >�����ѽ��</td>
	<td  width="2%" bgcolor="#CC99FF" >�μӴ����</td>
	<td  width="3%" bgcolor="#CC99FF" >������������</td>
	<td  width="3%" >�����������</td>
	<td  width="2%" >��д��־</td>
	<td  width="20%" >��ע</td>
	<td  width="8%" >ϵ��</td>
	<td  width="2%" >�Ƿ�������</td>
	<td  width="2%" >�����</td>
</tr>


<%
String xh=null;
String zcbm=null;
double zqdj=0;
double dpzk=0;
double dj=0;
double sl=0;
double zqje=0;
double je=0;
double ycf=0;
String zcpzwzbm=null;
String zcysbm=null;
String cxhdbz=null;
bz=null;
String jldwbm=null;
String qtfy=null;
String xzjg=null;
String zcmc=null;
String zclbbm=null;
String xinghao=null;
String gg=null;
String sfbhpj=null;
String pjts=null;
String lsj=null;
String yhj=null;
String sfycx=null;
String cxj=null;
String cxkssj=null;
String cxjzsj=null;
String bjbz=null;
double qtfyje=0;
String cxhdbl=null;
String cxhdje=null;
String gys=null;
String ppmc=null;
double cbj=0;
double jsbl=0;
double bzcbj=0;
double bzcxhdbl=0;
double cxcbj=0;
double lscxhdbl=0;
String sftjcp=null;
String sxbz=null;
String sxbzmc=null;
String sxhtyy=null;

int row=0;

	ls_sql="select xh,zcbm,zcmc,zclbbm,xinghao,gg,zqdj,dpzk,dj,sl,zqje,je,ycf,zcpzwzbm,zcysbm,DECODE(cxhdbz,'Y','�μ�','N','���μ�') cxhdbz,bz,jldwbm,DECODE(qtfy,'1','��װ��','2','�ӹ���','3','�����շ�','W','��') qtfy,xzjg,DECODE(sfbhpj,'Y','����','N','������') sfbhpj,pjts,lsj,yhj";
	ls_sql+=" ,sfycx,cxj,cxkssj,cxjzsj,qtfyje,cxhdbl,cxhdje,gys,ppmc,jsbl,cbj,bzcbj,bzcxhdbl,cxcbj,lscxhdbl,DECODE(sftjcp,'Y','��','N','��') sftjcp";
	ls_sql+=" ,sxbz,DECODE(sxbz,'1','����д','2','��д') sxbzmc,sxhtyy ";
	ls_sql+=" from  jc_zcddmx";
    ls_sql+=" where jc_zcddmx.ddbh='"+ddbh+"'";//1������д��2����д
	ls_sql+=" order by sxbz,xh";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		xh=cf.fillNull(rs.getString("xh"));
		sxbz=cf.fillNull(rs.getString("sxbz"));
		sxbzmc=cf.fillNull(rs.getString("sxbzmc"));
		sxhtyy=cf.fillHtml(rs.getString("sxhtyy"));
		zcbm=cf.fillNull(rs.getString("zcbm"));
		zcmc=cf.fillHtml(rs.getString("zcmc"));
		zclbbm=cf.fillHtml(rs.getString("zclbbm"));
		xinghao=cf.fillHtml(rs.getString("xinghao"));
		gg=cf.fillHtml(rs.getString("gg"));
		zqdj=rs.getDouble("zqdj");
		dpzk=rs.getDouble("dpzk");
		dj=rs.getDouble("dj");
		sl=rs.getDouble("sl");
		zqje=rs.getDouble("zqje");
		je=rs.getDouble("je");
		ycf=rs.getDouble("ycf");
		zcpzwzbm=cf.fillNull(rs.getString("zcpzwzbm"));
		zcysbm=cf.fillNull(rs.getString("zcysbm"));
		cxhdbz=cf.fillNull(rs.getString("cxhdbz"));
		bz=cf.fillNull(rs.getString("bz"));
		jldwbm=cf.fillNull(rs.getString("jldwbm"));
		qtfy=cf.fillNull(rs.getString("qtfy"));
		xzjg=cf.fillNull(rs.getString("xzjg"));
		sfbhpj=cf.fillNull(rs.getString("sfbhpj"));
		pjts=cf.fillNull(rs.getString("pjts"));
		lsj=cf.fillNull(rs.getString("lsj"));
		yhj=cf.fillNull(rs.getString("yhj"));
		sfycx=cf.fillNull(rs.getString("sfycx"));
		cxj=cf.fillNull(rs.getString("cxj"));
		cxkssj=cf.fillNull(rs.getDate("cxkssj"));
		cxjzsj=cf.fillNull(rs.getDate("cxjzsj"));
		qtfyje=rs.getDouble("qtfyje");
		cxhdbl=cf.fillNull(rs.getString("cxhdbl"));
		cxhdje=cf.fillNull(rs.getString("cxhdje"));
		gys=cf.fillNull(rs.getString("gys"));
		ppmc=cf.fillNull(rs.getString("ppmc"));
		jsbl=rs.getDouble("jsbl");
		cbj=rs.getDouble("cbj");
		bzcbj=rs.getDouble("bzcbj");
		bzcxhdbl=rs.getDouble("bzcxhdbl");
		cxcbj=rs.getDouble("cxcbj");
		lscxhdbl=rs.getDouble("lscxhdbl");
		sftjcp=cf.fillNull(rs.getString("sftjcp"));


		%>
		<tr bgcolor="#E8E8FF"  align="center">
			<td >
				<%=zcmc%>
			</td>
			<td >
				<%=xinghao%>
			</td>
			<td >
				<%=gg%>
			</td>
			<td >
				<input type="hidden" name="xh"  value="<%=xh%>" >
				<input type="text" name="cbj" size="9" maxlength="16"  value="<%=cbj%>"  style="border-color: #FFFFFF #FFFFFF #000000;border-style:solid">			</td>
			</td>
			<td ><%=sxhtyy%></td>
			<td ><%=sl%></td>
			<td ><%=zqdj%></td>
			<td ><%=dpzk%></td>
			<td ><%=dj%>
			</td>
			<td><%=zcysbm%></td>
			<td><%=zcpzwzbm%></td>
			<td ><%=jldwbm%></td>
			<td ><%=zqje%></td>
			<td><%=je%></td>
			<td ><%=ycf%></td>
			<td ><%=qtfy%></td>
			<td ><%=qtfyje%>
			<td><%=cxhdbz%></td>
			<td  ><%=cxhdbl%>%</td>
			<td ><%=cxhdje%></td>
			<td ><%=sxbzmc%></td>
			<td ><%=bz%></td>
			<td ><%=zclbbm%></td>
			<td ><%=sfbhpj%></td>
			<td ><%=pjts%></td>
		</tr>
		<%

		row++;

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
            <tr> 
              <td colspan="11" align="center"> 
                  <input type="hidden" name="ddbh" size="20" maxlength="9"  value="<%=ddbh%>" >
                  <input type="hidden" name="khbh" size="20" maxlength="20"  value="<%=khbh%>" >
              <input type="button"  value="������" onClick="f_wc(editform)" name="wc" >              </td>
            </tr>

</table>
</form>

          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right" bgcolor="#CCCCFF"> 
                �ͻ����              </td>
              <td width="29%" bgcolor="#CCCCFF"> <%=khbh%> </td>
              <td width="21%" align="right" bgcolor="#CCCCFF"> 
                ��ͬ��              </td>
              <td width="29%" bgcolor="#CCCCFF"><%=hth%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right">�ͻ�����</td>
              <td width="29%"><%=khxm%></td>
              <td width="21%" align="right">�ʼ�</td>
              <td width="29%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right">���ݵ�ַ</td>
              <td colspan="3"><%=fwdz%></td>
            </tr>
            <tr> 
              <td width="21%" bgcolor="#CCCCFF" align="right">ǩԼ����</td>
              <td width="29%" bgcolor="#CCCCFF"><%=dwmc%></td>
              <td width="21%" bgcolor="#CCCCFF" align="right">��װ���ʦ</td>
              <td width="29%" bgcolor="#CCCCFF"><%=sjs%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right"> 
                ʩ����              </td>
              <td width="29%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%></td>
              <td width="21%" align="right"> 
                �೤              </td>
              <td width="29%"><%=sgbz%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right"> 
                ��װǩԼ����              </td>
              <td width="29%"> <%=qyrq%> </td>
              <td width="21%" align="right"> 
                ��װǩԼ��              </td>
              <td width="29%"><%=qye%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="21%" align="right">��ͬ��������</td>
              <td width="29%"><%=kgrq%></td>
              <td width="21%" align="right">��ͬ��������</td>
              <td width="29%"><%=jgrq%></td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="21%" align="right">�μӴ����</td>
              <td width="29%"> <%=cxhdbm%> </td>
              <td width="21%" align="right">&nbsp;</td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right"><font color="#0000FF">��ͬ�ܶ�</font></td>
              <td width="29%"><%=hkze%></td>
              <td width="21%" align="right" bgcolor="#FFFFCC"><font color="#0000FF">δ���۽��</font></td>
              <td width="29%"><%=wdzje%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="21%" align="right"><font color="#0000FF">�����������</font></td>
              <td width="29%"><%=htcxhdje%></td>
              <td width="21%" align="right" bgcolor="#FFFFCC">&nbsp;</td>
              <td width="29%">&nbsp;</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#0033CC"><b>�ɱ����</b></font></td>
              <td><%=cbze%><font color="#FF0000">��<b>��ͬ</b>��</font></td>
              <td align="right"><font color="#0000CC">(�ۺ���Ϸ�-�ɱ�)/�ۺ���Ϸ�</font></td>
              <td><%=htjsbl%>��<font color="#FF0000">��<b>��ͬ</b>��</font></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#0033CC"><b>�ɱ����</b></font></td>
              <td><%=zjxcbze%><font color="#FF0000">��<b>������</b>��</font></td>
              <td align="right"><font color="#0000CC">(�ۺ���Ϸ�-�ɱ�)/�ۺ���Ϸ�</font></td>
              <td><%=zjxjsbl%>��<font color="#FF0000">��<b>������</b>��</font></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#0033CC"><b>�ɱ��ܶ�</b></font></td>
              <td><%=cf.formatDouble(cbze+zjxcbze)%><font color="#FF0000">��<b>��ͬ��������</b>��</font></td>
              <td align="right"><font color="#0000CC">(�ۺ���Ϸ�-�ɱ�)/�ۺ���Ϸ�</font></td>
              <td><%=alljsbl%>��<font color="#FF0000">��<b>��ͬ��������</b>��</font></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" bgcolor="#FFFFFF" align="right"><font color="#0000FF">���Ĵ���</font></td>
              <td width="29%"><%=zcdlbm%></td>
              <td width="21%" align="right"><font color="#0000FF">����С��</font></td>
              <td width="29%"><%=zcxlbm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"><font color="#0000FF">��Ʒ��</font></td>
              <td width="29%"><%=ppbm%></td>
              <td width="21%" align="right">�����ۿ�</td>
              <td width="29%"><%=zczkl%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">����ԭ��</td>
              <td colspan="3"><%=dzyy%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"><font color="#0000FF">Ʒ���Ƿ����Ż�</font></td>
              <td width="29%"><%
	cf.radioToken(out,"N+��&Y+��",sfyyh,true);
%></td>
              <td width="21%" align="right"><font color="#0000FF">�Ż���</font></td>
              <td width="29%">(<%=yhkssj%>)����(<%=yhjzsj%>)</td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"><font color="#0000FF">�Ż�����</font></td>
              <td colspan="3"><%=yhnr%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">��ĿרԱ</td>
              <td width="29%"><%=xmzy%></td>
              <td width="21%" align="right">�Ҿ����ʦ</td>
              <td width="29%"> <%=jjsjs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                פ��Ҿӹ���              </td>
              <td width="29%"> <%=clgw%></td>
              <td width="21%" align="right"> 
                չ���Ҿӹ���              </td>
              <td width="29%"> <%=ztjjgw%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                �Ƿ�ȴ��ͻ�֪ͨ              </td>
              <td width="29%"> 
                  <%
	cf.selectToken(out,"1+����ȴ�֪ͨ&2+��ȴ�֪ͨ",ddshbz,false);
%>              </td>
              <td width="21%" align="right"> 
                              </td>
              <td width="29%"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">��ͬ�ͻ�ʱ��</td>
              <td width="29%"><%=htshsj%></td>
              <td width="21%" align="right">ǩ��ͬʱ��</td>
              <td width="29%"><%=qhtsj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right"> 
                �ɼ����ֹʱ��              </td>
              <td width="29%"><%=kjxsj%></td>
              <td width="21%">&nbsp;</td>
              <td width="29%">&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="21%" align="right">��ע</td>
              <td colspan="3"><%=bz%></td>
            </tr>
        </table>
  
	  

</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_plxg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	FormName.action="PlLrJsjJc_zcddmx.jsp";
	FormName.submit();
//	FormName.wc.disabled=false;
	return true;
}

function f_zxxg(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}
	FormName.action="Jc_zcddmxLrJsjList.jsp";
	FormName.submit();
//	FormName.wc.disabled=false;
	return true;
}
function f_wc(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.ddbh)=="") {
		alert("������[�������]��");
		FormName.ddbh.focus();
		return false;
	}

	FormName.action="WcSxhtshJsj.jsp";
	FormName.submit();
	return true;
}


//-->
</SCRIPT>
