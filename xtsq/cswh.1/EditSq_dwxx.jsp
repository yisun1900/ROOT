<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010102")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
String dwbh=null;
String dwmc=null;
String dwjc=null;
String ssdw=null;
String dwlx=null;
String dwdz=null;
String dwfzr=null;
String dwdh=null;
String dwcz=null;
String email=null;
String dqbm=null;
String bz=null;
String sfjms=null;
String hthqz=null;
String cxbz=null;
String ssfgs=null;
String bianma=null;
String cwdm=null;
String ssdqbm=null;
String dwflbm=null;
String ssfw=null;
String dwjb=null;
String kdsj=null;
String gdsj=null;
String dmxs=null;
String bzrs=null;

String jcppbz=null;
String zcmmbz=null;
String mmbz=null;
String cgjjbz=null;
String jjbz=null;
String zxkhlrjc=null;
String zxkhlrts=null;
String qdkhbljc=null;
String qdkhblts=null;
String dzbjjc=null;
String hfsjzdsz=null;
String xmzyglbz=null;
String jjgwglbz=null;
String jcddblxs=null;
String jcddmxblxs=null;
String kfdh=null;
String jjsjsglbz=null;
String khxxglsj=null;
String djlrfs=null;
String kgcxhdbl=null;
String xuhao=null;
double bzlybl=0;
double lyblxx=0;
double lyblsx=0;
String dhqh=null;


String wheredwbh=cf.GB2Uni(request.getParameter("dwbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;

String dzbjbz=null;
double jryjbfb=0;
double sjjryjbfb=0;

Reader is=null;
BufferedReader br=null;

try {
	conn=cf.getConnection();

	oracle.sql.CLOB  clob=null;
	
	ls_sql="select khxxglsj,jjsjsglbz,kfdh,sjjryjbfb,jcddblxs,jcddmxblxs,jjgwglbz,jcppbz,zcmmbz,mmbz,cgjjbz,jjbz,zxkhlrjc,zxkhlrts,qdkhbljc,qdkhblts,dzbjjc,hfsjzdsz,xmzyglbz ,jryjbfb,dwjb,ssfw,dwbh,dwmc,dwjc,ssdw,dwlx,dwdz,dwfzr,dwdh,dwcz,email,bz,dqbm,sfjms,hthqz,cxbz,ssfgs,bianma,cwdm,ssdqbm,dwflbm,kdsj,gdsj,dmxs,bzrs";
	ls_sql+=" ,djlrfs,kgcxhdbl,xuhao,bzlybl,lyblxx,lyblsx,dhqh";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+wheredwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dhqh=cf.fillNull(rs.getString("dhqh"));
		bzlybl=rs.getDouble("bzlybl");
		lyblxx=rs.getDouble("lyblxx");
		lyblsx=rs.getDouble("lyblsx");

		xuhao=cf.fillNull(rs.getString("xuhao"));
		djlrfs=cf.fillNull(rs.getString("djlrfs"));
		kgcxhdbl=cf.fillNull(rs.getString("kgcxhdbl"));
		khxxglsj=cf.fillNull(rs.getDate("khxxglsj"));
		jjsjsglbz=cf.fillNull(rs.getString("jjsjsglbz"));
		kfdh=cf.fillNull(rs.getString("kfdh"));
		jcddblxs=cf.fillNull(rs.getString("jcddblxs"));
		jcddmxblxs=cf.fillNull(rs.getString("jcddmxblxs"));
		jcppbz=cf.fillNull(rs.getString("jcppbz"));
		zcmmbz=cf.fillNull(rs.getString("zcmmbz"));
		mmbz=cf.fillNull(rs.getString("mmbz"));
		cgjjbz=cf.fillNull(rs.getString("cgjjbz"));
		jjbz=cf.fillNull(rs.getString("jjbz"));
		zxkhlrjc=cf.fillNull(rs.getString("zxkhlrjc"));
		zxkhlrts=cf.fillNull(rs.getString("zxkhlrts"));
		qdkhbljc=cf.fillNull(rs.getString("qdkhbljc"));
		qdkhblts=cf.fillNull(rs.getString("qdkhblts"));
		dzbjjc=cf.fillNull(rs.getString("dzbjjc"));
		hfsjzdsz=cf.fillNull(rs.getString("hfsjzdsz"));
		xmzyglbz=cf.fillNull(rs.getString("xmzyglbz"));
		jjgwglbz=cf.fillNull(rs.getString("jjgwglbz"));

		sjjryjbfb=rs.getDouble("sjjryjbfb");
		jryjbfb=rs.getDouble("jryjbfb");
		dwjb=cf.fillNull(rs.getString("dwjb"));
		ssfw=cf.fillNull(rs.getString("ssfw"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		dwjc=cf.fillNull(rs.getString("dwjc"));
		ssdw=cf.fillNull(rs.getString("ssdw"));
		dwlx=cf.fillNull(rs.getString("dwlx"));
		dwdz=cf.fillNull(rs.getString("dwdz"));
		dwfzr=cf.fillNull(rs.getString("dwfzr"));
		dwdh=cf.fillNull(rs.getString("dwdh"));
		dwcz=cf.fillNull(rs.getString("dwcz"));
		email=cf.fillNull(rs.getString("email"));
		bz=cf.fillNull(rs.getString("bz"));
		dqbm=cf.fillNull(rs.getString("dqbm"));
		sfjms=cf.fillNull(rs.getString("sfjms"));
		hthqz=cf.fillNull(rs.getString("hthqz"));
		cxbz=cf.fillNull(rs.getString("cxbz"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		bianma=cf.fillNull(rs.getString("bianma"));
		cwdm=cf.fillNull(rs.getString("cwdm"));
		ssdqbm=cf.fillNull(rs.getString("ssdqbm"));
		dwflbm=cf.fillNull(rs.getString("dwflbm"));
		kdsj=cf.fillNull(rs.getDate("kdsj"));
		gdsj=cf.fillNull(rs.getDate("gdsj"));
		dmxs=cf.fillNull(rs.getString("dmxs"));
		bzrs=cf.fillNull(rs.getString("bzrs"));

	}
	rs.close();
	ps.close();

	ls_sql="select dzbjbz";
	ls_sql+=" from  bj_dzbjbz";
	ls_sql+=" where  (dwbh='"+wheredwbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		clob=(oracle.sql.CLOB)rs.getClob("dzbjbz");
	}
	rs.close();
	ps.close();

	dzbjbz="";

	if(clob!=null){
		is=clob.getCharacterStream();
		br=new BufferedReader(is);
		String s=br.readLine();
		while(s!=null)
		{
			dzbjbz+=s+",";
			s=br.readLine();
		}

		br.close();
		is.close();
	}
	if (dzbjbz==null)
	{
		dzbjbz="";
	}
	if (dzbjbz.length()>1)
	{
		dzbjbz=dzbjbz.substring(0,dzbjbz.length()-1);
	}
	else{
		dzbjbz="";
	}


}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL=" +ls_sql);
	return;
}
finally 
{
	try{
		br.close();
		is.close();

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
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ���޸���Ϣ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr> 
              <td colspan="4" align="center" > 
                  <input type="hidden" name="wheredwbh"  value="<%=wheredwbh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                  <input type="button"  value="¼����ĿרԱ" onClick="f_lrxmzy(editform)" name="lr">
                  <input type="button"  value="�鿴��ĿרԱ" onClick="f_ck(editform)" name="ck">
                  <input type="button"  value="¼�빫˾����Ͷ�߲���" onClick="f_lrclts(editform)" name="lr2">              </td>
            </tr>
            <tr>
              <td bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font><font color="#0000FF">��λ���</font> </td>
              <td bgcolor="#CCCCFF"><input type="text" name="dwbh" size="20" maxlength="5"  value="<%=dwbh%>" readonly></td>
              <td bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font>��λ����</td>
              <td bgcolor="#CCCCFF"><input type="text" name="dwmc" size="20" maxlength="100"  value="<%=dwmc%>" ></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font>��λ����</td>
              <td width="25%" bgcolor="#CCCCFF"> 
                <select name="dwlx" style="FONT-SIZE:12PX;WIDTH:152PX"   onChange="changelx(editform)">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"A0+�ܲ�&A1+�ܲ�������&F0+�ֹ�˾&F1+�ֹ�˾������&F2+����&F3+���С��&F4+�г�С��&F5+����С��",dwlx);
%> 
                </select>              </td>
              <td width="24%" bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font>��λ����</td>
              <td width="28%" bgcolor="#CCCCFF"> 
                <select name="dwflbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwflbm,dwflmc from dm_dwflbm order by dwflbm",dwflbm);
%> 
                </select>              </td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font>��������</td>
              <td width="25%" bgcolor="#CCCCFF"> 
                <select name="dqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dqbm,dqmc from dm_dqbm  order by dqbm",dqbm);
%> 
                </select>              </td>
              <td width="24%" bgcolor="#CCCCFF" align="right"><font color="#CC0000">*</font>��������</td>
              <td width="28%" bgcolor="#CCCCFF"> 
                <select name="ssdqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssdqbm,ssdqmc from sq_ssdqbm order by ssdqbm",ssdqbm);
%> 
                </select>              </td>
            </tr>
            <tr> 
              <td width="23%" align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font>�����ֹ�˾</td>
              <td width="25%" bgcolor="#CCCCFF"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="changefgs(editform)">
                  <%
	if (dwlx.equals("A0"))//A0:�ܲ�; A1:�ܲ�����; F0:�ֹ�˾��F1:�ֹ�˾���ţ�F2���ֹ�˾���棻F3������С��
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
	else if (dwlx.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
	}
	else 
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwlx in('F0') and cxbz='N'  order by dwbh",ssfgs);
	}
%> 
                </select>              </td>
              <td width="24%" align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font>�ϼ���λ</td>
              <td width="28%" bgcolor="#CCCCFF"> 
                <select name="ssdw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	if (dwlx.equals("A0"))//A0:�ܲ�; A1:�ܲ�����; F0:�ֹ�˾��F1:�ֹ�˾���ţ�F2���ֹ�˾���棻F3������С��
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssdw+"'",ssdw);
	}
	else if (dwlx.equals("A1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssdw+"'",ssdw);
	}
	else if (dwlx.equals("F0"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssdw+"'",ssdw);
	}
	else if (dwlx.equals("F1"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssdw+"'",ssdw);
	}
	else if (dwlx.equals("F2"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssdw+"'",ssdw);
	}
	else if (dwlx.equals("F3"))
	{
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where ssfgs='"+ssfgs+"' and dwlx in('F1','F2') and cxbz='N'  order by dwlx,dwbh",ssdw);
	}
%> 
                </select>              </td>
            </tr>
            
            <tr> 
              <td width="23%" align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font>��˾����</td>
              <td bgcolor="#CCCCFF">
              <%
	cf.radioToken(out, "sfjms","N+ֱӪ��˾&Y+���˹�˾&Q+������˾",sfjms);
%></td>
              <td align="right" bgcolor="#CCCCFF"><font color="#CC0000">*</font>������־</td>
              <td bgcolor="#CCCCFF"><select name="cxbz" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
	cf.selectToken(out,"Y+�ѳ���&N+δ����",cxbz);
%>
              </select></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="23%" align="right">����</td>
              <td width="25%"> 
                <input type="text" name="bianma" value="<%=bianma%>" size="6" maxlength="2" >
                ����ʩ���ӵȱ���ʹ�� </td>
              <td width="24%" align="right">�绰����</td>
              <td width="28%"><input name="dhqh" type="text" value="<%=dhqh%>" size="20" maxlength="10"></td>
            </tr>
            <tr> 
              <td width="23%" align="right" bgcolor="#CCCCFF">��ͬ��ǰ׺</td>
              <td width="25%" bgcolor="#CCCCFF"> 
                <input type="text" name="hthqz" value="<%=hthqz%>" size="20" maxlength="20" >              </td>
              <td width="24%" align="right" bgcolor="#CCCCFF">�������</td>
              <td width="28%" bgcolor="#CCCCFF"> 
                <input type="text" name="cwdm" value="<%=cwdm%>" size="20" maxlength="20" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">������ʽ</td>
              <td width="25%"> 
                <select name="dmxs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dmxs,dmxsmc from dm_dmxs order by dmxs",dmxs);
%> 
                </select>              </td>
              <td width="24%" align="right">��׼����</td>
              <td width="28%"> 
                <input type="text" name="bzrs" value="<%=bzrs%>" size="20" maxlength="8" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="23%" align="right">������λ</td>
              <td width="25%"> 
                <select name="ssfw" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select ssfw,ssfwmc from dm_ssfw order by ssfw",ssfw);
%> 
                </select>              </td>
              <td width="24%" align="right">��λ����</td>
              <td width="28%"> 
                <select name="dwjb" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select dwjb,dwjbmc from dm_dwjb order by dwjb",dwjb);
%> 
                </select>              </td>
            </tr>
            <tr> 
              <td width="23%" align="right" bgcolor="#FFFFFF">��λ��ַ</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="dwdz" size="74" maxlength="100"  value="<%=dwdz%>" >              </td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">��λ�绰</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="dwdh" size="74" maxlength="100"  value="<%=dwdh%>" >              </td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">�ͷ��绰</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="kfdh" size="74" maxlength="50"  value="<%=kfdh%>" >              </td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">��λ����</td>
              <td width="25%" bgcolor="#FFFFFF"> 
                <input type="text" name="dwcz" size="20" maxlength="50"  value="<%=dwcz%>" >              </td>
              <td width="24%" bgcolor="#FFFFFF" align="right">���</td>
              <td width="28%" bgcolor="#FFFFFF"><input name="xuhao" type="text" value="<%=xuhao%>" size="20" maxlength="8" ></td>
            </tr>
            <tr> 
              <td width="23%" align="right" bgcolor="#FFFFFF"> 
                ��λ������              </td>
              <td width="25%" bgcolor="#FFFFFF"> 
                <input type="text" name="dwfzr" size="20" maxlength="20"  value="<%=dwfzr%>" >              </td>
              <td width="24%" align="right" bgcolor="#FFFFFF"> 
                ��λEMail              </td>
              <td width="28%" bgcolor="#FFFFFF"> 
                <input type="text" name="email" size="20" maxlength="50"  value="<%=email%>" >              </td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">����ʱ��</td>
              <td width="25%" bgcolor="#FFFFFF"> 
                <input type="text" name="kdsj" value="<%=kdsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
              <td width="24%" bgcolor="#FFFFFF" align="right">�ص�ʱ��</td>
              <td width="28%" bgcolor="#FFFFFF"> 
                <input type="text" name="gdsj" value="<%=gdsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr> 
              <td width="23%" align="right" bgcolor="#FFFFFF"> 
                ��ע              </td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="bz" cols="72" rows="2"><%=bz%></textarea>              </td>
            </tr>
            <tr> 
              <td width="23%" align="right" bgcolor="#FFFFFF">���ӱ��۱�ע</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="dzbjbz" cols="72" rows="21"><%=dzbjbz%></textarea>              </td>
            </tr>
            <tr align="center" bgcolor="#CCCCFF"> 
              <td colspan="4" height="26"><b>������ã�ֻ�зֹ�˾���ܲ���¼�룩</b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">��װ�ͻ�����ҵ���տ����</td>
              <td bgcolor="#FFFFFF"> 
                <input type="text" name="jryjbfb" value="<%=jryjbfb%>" size="10" maxlength="20" >
                �� (��Էֹ�˾)</td>
              <td align="right" bgcolor="#FFFFFF">��ƿͻ�����ҵ���տ����</td>
              <td bgcolor="#FFFFFF"> 
                <input type="text" name="sjjryjbfb" value="<%=sjjryjbfb%>" size="10" maxlength="20" >
                �� (��Էֹ�˾)</td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">Ͷ�߱��޹�Ӧ�̼��</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcppbz","Y+�޶����޷�¼��&N+�޶�����¼��",jcppbz);
%> <BR>
                <b><font color="#000099">Ͷ�߱���ʱ��[��Ӧ��]���������ȡ����</font></b></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">�����տ���</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zcmmbz","Y+�޶��������տ�&N+�޶������տ�&M+�ɿ�",zcmmbz);
%>
                  <BR>
                  <b><font color="#000099">���������Ŀ�ʱ��[�տ�Ʒ��]���������ȡ����</font></b></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">ľ���տ���</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "mmbz","Y+�޶��������տ�&N+�޶������տ�&M+�ɿ�",mmbz);
%>
                  <BR>
                  <b><font color="#000099">������ľ�ſ�ʱ��[�տ�Ʒ��]���������ȡ����</font></b></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">�����տ���</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "cgjjbz","Y+�޶��������տ�&N+�޶������տ�&M+�ɿ�",cgjjbz);
%>
                  <BR>
              <b><font color="#000099">�����ճ����ʱ��[�տ�Ʒ��]���������ȡ����</font></b></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">�Ҿ��տ���</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjbz","Y+�޶��������տ�&N+�޶������տ�&M+�ɿ�",jjbz);
%>
                  <BR>
              <b><font color="#000099">�����ռҾ߿�ʱ��[�տ�Ʒ��]���������ȡ����</font></b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">���ûط�ʱ���Զ����ã�4λ��</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="hfsjzdsz" value="<%=hfsjzdsz%>" size="10" maxlength="4" >
                <BR>
                <b><font color="#000099">���ݹ��̲����õĹ��̽��ȣ��Զ�������Ӧ�Ŀͷ��ط�ʱ�䣬��1λ�������طã���2λ�����ι��̻طã���3λ�����ڻطã���4λ���깤�ط� 
                ��1�����ã�0��������</font> </b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">������ѯ�ͻ�¼����</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "zxkhlrjc","N+������&Y+����",zxkhlrjc);
%><b><BR>
                <font color="#000099">��ѯ�ͻ����ϱ�����ǰ������¼�룬����������ǩ���Ǽ�</font></b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">��ѯ�ͻ���ǰ¼������</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="zxkhlrts" value="<%=zxkhlrts%>" size="10" maxlength="8" >
                <BR>
                <b><font color="#000099">ǩ���Ǽ��У�[��ѯ¼��ʱ��]��[ǩ��¼��ʱ��]���������С����</font>                </b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">����ǩ���ͻ���¼���</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "qdkhbljc","N+������&Y+����",qdkhbljc);
%><BR>
                <b><font color="#000099">�Բ�¼ǩ���ͻ��������ƣ�����ĳ����󣬲�����¼</font></b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">ǩ���ͻ���¼��������</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <input type="text" name="qdkhblts" value="<%=qdkhblts%>" size="10" maxlength="8" >
                <BR>
                <b><font color="#000099">ǩ���Ǽ��У�[ǩ��¼��ʱ��]��[ǩԼʱ��]��������������</font></b>              </td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">���ɶ�����[<b>��ĿרԱ</b>]����</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "xmzyglbz","N+������&Y+����",xmzyglbz);
%> <BR>
                <b><font color="#000099">���ɼҾӶ�������ĿרԱ���й��ˣ��������Լ��ĵ����ܿ�</font></b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">���ɶ�����[<b>�Ҿӹ���</b>]����</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjgwglbz","N+������&Y+����",jjgwglbz);
%> <br>
                <b><font color="#000099">���ɼҾӶ����ԼҾӹ��ʽ��й��ˣ��������Լ��ĵ����ܿ�</font></b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">���ɶ�����[<b>�Ҿ����ʦ</b>]����</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jjsjsglbz","N+������&Y+����",jjsjsglbz);
%> <br>
                <b><font color="#000099">���ɼҾӶ����ԼҾ����ʦ���й��ˣ��������Լ��ĵ����ܿ�</font></b></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFCC" align="right">�ͻ���Ϣ����ʱ��</td>
              <td colspan="3" bgcolor="#FFFFCC"> 
                <input type="text" name="khxxglsj" value="<%=khxxglsj%>" size="15" maxlength="10" onDblClick="JSCalendar(this)">
                <font color="#0000FF"><strong>��ֻ���ܲ����ã��ֹ�˾�������ô˲�����</strong> </font></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">���õ��ӱ��ۼ��</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "dzbjjc","1+1���˹�¼��[�ۿ��ʡ�����ԭ����]������[�ۿ��ʡ�����ԭ����]�Զ�����[ǩԼ��]<BR>&2+2���˹�¼��[ǩԼ�����ԭ����]������[ǩԼ�����ԭ����]�Զ�����[�ۿ���]<BR>&3+3��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����]�����Զ����㣬����¼����<BR>&6+6��ȫ���˹�¼��[�ۿ��ʡ�ǩԼ���ͬԭ����]�����Զ����㣬��¼����<BR>&4+4�����������ӱ��ۣ�[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]���ɸ�<BR>&7+7��[��ͬԭ����]ȡ�Ե��ӱ��ۣ�[�ۿ���]ȡ���������Զ�����[ǩԼ��]���ɸģ��ɸ������Ż�<BR>&5+5�����������ӱ��ۣ�[����ԭ����]ȡ�Ե��ӱ��۲��ɸģ��˹�¼��[�ۿ���]���Զ�����[ǩԼ��]",dzbjjc);
%></td>
            </tr>
            <tr> 
              <td width="23%" bgcolor="#FFFFFF" align="right">���ɶ�������С��</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcddblxs","2+2λС��&1+1λС��&0+������λ&-1+����ʮλ&-2+������λ&-3+����ǧλ",jcddblxs);
%></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">���ɶ�����ϸ����С��</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "jcddmxblxs","2+2λС��&1+1λС��&0+������λ&-1+����ʮλ&-2+������λ&-3+����ǧλ",jcddmxblxs);
%></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF" align="right">���Ķ�������¼�뷽ʽ</td>
              <td colspan="3" bgcolor="#FFFFFF"><%
	cf.radioToken(out, "djlrfs","1+¼�뵥�����ۿ�&2+¼���ۿ��㵥��&3+���ɴ���",djlrfs);
%></td>
            </tr>
            
            <tr bgcolor="#FFFFFF">
              <td align="right">���ģ���׼���ñ���</td>
              <td><input type="text" name="bzlybl" size="14" maxlength="9"  value="<%=bzlybl%>" >
                �ٷֱ� </td>
              <td align="right">���Ķ����ɸĴ��������</td>
              <td><%
	cf.radioToken(out, "kgcxhdbl","Y+�ɸ�&N+���ɸ�",kgcxhdbl);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">�������ñ���������</td>
              <td><input type="text" name="lyblxx" size="14" maxlength="9"  value="<%=lyblxx%>" >
                �ٷֱ�</td>
              <td align="right">�������ñ��������� </td>
              <td><input type="text" name="lyblsx" size="14" maxlength="9"  value="<%=lyblsx%>" >
                �ٷֱ�</td>
            </tr>
            <tr> 
              <td colspan="4" align="center" > 
                  <input type="hidden" name="wheredwbh"  value="<%=wheredwbh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                  <input type="button"  value="¼����ĿרԱ" onClick="f_lrxmzy(editform)" name="lr">
                  <input type="button"  value="�鿴��ĿרԱ" onClick="f_ck(editform)" name="ck">
                  <input type="button"  value="¼�빫˾����Ͷ�߲���" onClick="f_lrclts(editform)" name="lr2">              </td>
            </tr>
        </table>
</form>

	  
	  
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	cf.ajax(out);//����AJAX
%>

var czlx;

function changelx(FormName) 
{
	FormName.ssdw.length=0;
	FormName.ssfgs.length=0;

	if(	javaTrim(FormName.dwlx)=="") 
	{
		return false;
	}


	czlx=1;

	var sql;

	if (FormName.dwlx.value=="A0")//A0:�ܲ�; A1:�ܲ�����; F0:�ֹ�˾��F1:�ֹ�˾���ţ�F2���ֹ�˾���棻F3������С��
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="A1")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else
	{
		sql="select dwbh,dwmc from sq_dwxx where dwlx in('F0') and cxbz='N'  order by dwbh";
	}


	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);

	openAjax(actionStr);
}

function changefgs(FormName) 
{
	if(	javaTrim(FormName.dwlx)=="") 
	{
		alert("��ѡ��[��λ����]��");
		FormName.dwlx.focus();
		return false;
	}

	FormName.ssdw.length=0;

	if(	javaTrim(FormName.ssfgs)=="") 
	{
		return false;
	}

	czlx=2;

	var sql;

	if (FormName.dwlx.value=="A0")//A0:�ܲ�; A1:�ܲ�����; F0:�ֹ�˾��F1:�ֹ�˾���ţ�F2���ֹ�˾���棻F3������С��
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="A1")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="F0")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='99999'";
	}
	else if (FormName.dwlx.value=="F1")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='"+FormName.ssfgs.value+"' order by dwbh";
	}
	else if (FormName.dwlx.value=="F2")
	{
		sql="select dwbh,dwmc from sq_dwxx where dwbh='"+FormName.ssfgs.value+"' order by dwbh";
	}
	else if (FormName.dwlx.value=="F3" || FormName.dwlx.value=="F4" || FormName.dwlx.value=="F5")
	{
		sql="select dwbh,dwmc from sq_dwxx where ssfgs='"+FormName.ssfgs.value+"' and dwlx in('F1','F2') and cxbz='N'  order by dwlx,dwbh";
	}



	var actionStr="/ajax/selectstr.jsp?sql="+sql;


//	window.open(actionStr);

	openAjax(actionStr);
}


function getAjax(ajaxRetStr) 
{
//	alert(ajaxRetStr);
	if (czlx==1)
	{
		strToSelect(editform.ssfgs,ajaxRetStr);
	}
	else if (czlx==2)
	{
		strToSelect(editform.ssdw,ajaxRetStr);
	}

}


function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.dwmc)=="") {
		alert("������[��λ����]��");
		FormName.dwmc.focus();
		return false;
	}
	if(	javaTrim(FormName.dwlx)=="") {
		alert("��ѡ��[��λ����]��");
		FormName.dwlx.focus();
		return false;
	}

	if(	javaTrim(FormName.dwflbm)=="") {
		alert("��ѡ��[��λ����]��");
		FormName.dwflbm.focus();
		return false;
	}

	if(	javaTrim(FormName.dqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.dqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.ssfgs)=="") {
		alert("��ѡ��[�����ֹ�˾]��");
		FormName.ssfgs.focus();
		return false;
	}
	if(	javaTrim(FormName.ssdw)=="") {
		alert("��ѡ��[�ϼ���λ]��");
		FormName.ssdw.focus();
		return false;
	}
	if(	javaTrim(FormName.ssdqbm)=="") {
		alert("��ѡ��[��������]��");
		FormName.ssdqbm.focus();
		return false;
	}

	
	
	if(	!radioChecked(FormName.sfjms)) {
		alert("��ѡ��[��˾����]��");
		FormName.sfjms[0].focus();
		return false;
	}
	if(!(isNumber(FormName.bzrs, "��׼����"))) {
		return false;
	}
	if(!(isDatetime(FormName.kdsj, "����ʱ��"))) {
		return false;
	}
	if(!(isDatetime(FormName.gdsj, "�ص�ʱ��"))) {
		return false;
	}


	if (FormName.dwlx.value=="F0")//�ֹ�˾
	{
		if(	javaTrim(FormName.dhqh)=="") {
			alert("������[�绰����]��");
			FormName.dhqh.focus();
			return false;
		}
		if(!(isNumber(FormName.dhqh, "�绰����"))) {
			return false;
		}
		if(	javaTrim(FormName.bzlybl)=="") {
			alert("������[��׼���ñ���]��");
			FormName.bzlybl.focus();
			return false;
		}
		if(!(isFloat(FormName.bzlybl, "��׼���ñ���"))) {
			return false;
		}
		if(	javaTrim(FormName.lyblxx)=="") {
			alert("������[���ñ�������]��");
			FormName.lyblxx.focus();
			return false;
		}
		if(!(isFloat(FormName.lyblxx, "���ñ�������"))) {
			return false;
		}
		if(	javaTrim(FormName.lyblsx)=="") {
			alert("������[���ñ�������]��");
			FormName.lyblsx.focus();
			return false;
		}
		if(!(isFloat(FormName.lyblsx, "���ñ�������"))) {
			return false;
		}

		if(	javaTrim(FormName.bianma)=="") {
			alert("��ѡ��[����]��");
			FormName.bianma.focus();
			return false;
		}

		if(	javaTrim(FormName.jryjbfb)=="") {
			alert("��ѡ��[��װ�ͻ�����ҵ���տ����]��");
			FormName.jryjbfb.focus();
			return false;
		}
		if(!(isFloat(FormName.jryjbfb, "��װ�ͻ�����ҵ���տ����"))) {
			return false;
		}

		if(parseFloat(FormName.jryjbfb.value)<0 || parseInt(FormName.jryjbfb.value)>100) 
		{
			alert("[��װ�ͻ�����ҵ���տ����]����ֻ����0��100֮��");
			FormName.jryjbfb.select();
			return false;
		}

		if(	javaTrim(FormName.sjjryjbfb)=="") {
			alert("��ѡ��[��ƿͻ�����ҵ���տ����]��");
			FormName.sjjryjbfb.focus();
			return false;
		}
		if(!(isFloat(FormName.sjjryjbfb, "��ƿͻ�����ҵ���տ����"))) {
			return false;
		}

		if(parseFloat(FormName.sjjryjbfb.value)<0 || parseInt(FormName.sjjryjbfb.value)>100) 
		{
			alert("[��ƿͻ�����ҵ���տ����]����ֻ����0��100֮��");
			FormName.sjjryjbfb.select();
			return false;
		}

		
		if(	!radioChecked(FormName.jcppbz)) {
			alert("��ѡ��[Ͷ�߱��޹�Ӧ�̼��]��");
			FormName.jcppbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zcmmbz)) {
			alert("��ѡ��[�����տ���]��");
			FormName.zcmmbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.mmbz)) {
			alert("��ѡ��[ľ���տ���]��");
			FormName.mmbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.cgjjbz)) {
			alert("��ѡ��[�����տ���]��");
			FormName.cgjjbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.jjbz)) {
			alert("��ѡ��[�Ҿ��տ���]��");
			FormName.jjbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.zxkhlrjc)) {
			alert("��ѡ��[������ѯ�ͻ�¼����]��");
			FormName.zxkhlrjc[0].focus();
			return false;
		}
		if (FormName.zxkhlrjc[1].checked)
		{
			if(	javaTrim(FormName.zxkhlrts)=="") {
				alert("��ѡ��[��ѯ�ͻ���ǰ¼������]��");
				FormName.zxkhlrts.focus();
				return false;
			}
			if(!(isNumber(FormName.zxkhlrts, "��ѯ�ͻ���ǰ¼������"))) {
				return false;
			}
		}
		else{
			FormName.zxkhlrts.value="";
		}


		if(	!radioChecked(FormName.qdkhbljc)) {
			alert("��ѡ��[����ǩ���ͻ���¼���]��");
			FormName.qdkhbljc[0].focus();
			return false;
		}
		if (FormName.qdkhbljc[1].checked)
		{
			if(	javaTrim(FormName.qdkhblts)=="") {
				alert("��ѡ��[ǩ���ͻ���¼��������]��");
				FormName.qdkhblts.focus();
				return false;
			}
			if(!(isNumber(FormName.qdkhblts, "ǩ���ͻ���¼��������"))) {
				return false;
			}
		}
		else{
			FormName.qdkhblts.value="";
		}

		if(	!radioChecked(FormName.dzbjjc)) {
			alert("��ѡ��[���õ��ӱ��ۼ��]��");
			FormName.dzbjjc[0].focus();
			return false;
		}

		if(	javaTrim(FormName.hfsjzdsz)=="") {
			alert("��ѡ��[���ûط�ʱ���Զ�����]��");
			FormName.hfsjzdsz.focus();
			return false;
		}
		if (FormName.hfsjzdsz.value.length!=4)
		{
			alert("[���ûط�ʱ���Զ�����]����4λ��");
			FormName.hfsjzdsz.focus();
			return false;
		}


		if(	!radioChecked(FormName.xmzyglbz)) {
			alert("��ѡ��[���ɶ�������ĿרԱ����]��");
			FormName.xmzyglbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.jjgwglbz)) {
			alert("��ѡ��[���ɶ����ԼҾӹ��ʹ���]��");
			FormName.jjgwglbz[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.jjsjsglbz)) {
			alert("��ѡ��[���ɶ����ԼҾ����ʦ���˱�־]��");
			FormName.jjsjsglbz[0].focus();
			return false;
		}


		if(	!radioChecked(FormName.jcddblxs)) {
			alert("��ѡ��[���ɶ�������С��]��");
			FormName.jcddblxs[0].focus();
			return false;
		}

		if(	!radioChecked(FormName.jcddmxblxs)) {
			alert("��ѡ��[���ɶ�����ϸ����С��]��");
			FormName.jcddmxblxs[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.djlrfs)) {
			alert("��ѡ��[���Ķ�������¼�뷽ʽ]��");
			FormName.djlrfs[0].focus();
			return false;
		}
		if(	!radioChecked(FormName.kgcxhdbl)) {
			alert("��ѡ��[���Ķ����ɸĴ��������]��");
			FormName.kgcxhdbl[0].focus();
			return false;
		}
		if (FormName.djlrfs[2].checked)
		{
			if (FormName.kgcxhdbl[0].checked)
			{
				alert("���󣡵��۲��ɴ��ۣ�����ѡ�񡾲��ɸġ�");
				FormName.kgcxhdbl[1].focus();
				return false;
			}
		}

	
	}

	if(!(isDatetime(FormName.khxxglsj, "�ͻ���Ϣ����ʱ��"))) {
		return false;
	}
	if (FormName.dwlx.value=="A0")
	{
		if(	javaTrim(FormName.khxxglsj)=="") {
			alert("��ѡ��[�ͻ���Ϣ����ʱ��]��");
			FormName.khxxglsj.focus();
			return false;
		}
	}

	if(!(isInt(FormName.xuhao, "���"))) {
		return false;
	}


	FormName.action="SaveEditSq_dwxx.jsp";
	FormName.submit();
	return true;
}

function f_lrxmzy(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="InsertSq_xmzy.jsp";
	FormName.submit();
	return true;
}

function f_lrclts(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="InsertSq_tsclbm.jsp";
	FormName.submit();
	return true;
}


function f_ck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.dwbh)=="") {
		alert("������[��λ���]��");
		FormName.dwbh.focus();
		return false;
	}

	FormName.action="Sq_xmzyList.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>











