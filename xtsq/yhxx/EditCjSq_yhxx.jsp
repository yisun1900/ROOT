<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010202")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
	String dlyhjs=(String)session.getAttribute("yhjs");



String yhdlm=null;
String yhmc=null;
String yhkl=null;
String yhjs=null;
String dwbh=null;
String xb=null;
String csrq=null;
String dh=null;
String email=null;
String zz=null;
String bjjb=null;
String bz=null;
String sjsbh=null;
String ssfgs=null;

String zwbm=null;
String ckjgbz=null;
String zdyhbz=null;
String kdlxtbz=null;
String kkbbz=null;

String sjxzbz=null;
String sbsj=null;
String xbsj=null;
String ipxzbz=null;
String ipdz=null;
String wkxzbz=null;
String wkdz=null;
String khdhbz=null;
String kkglfx=null;
String mmsyzq=null;
String yxdlsbcs=null;
String bsxtsmmzq=null;
String sfyxzhmm=null;

String kfgssq=null;
String sqxz1Style="";
String sqxz2Style="";
String sqxz3Style="";
String sqxz4Style="";
String sqxz5Style="";

String sjsbjjb="";
String dqbm=null;
String sfkdybj=null;
double zdmll=0;
int sqtszkcs=0;


String whereygbh=cf.GB2Uni(request.getParameter("ygbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();


	ls_sql="select zdmll,sfkdybj,sfyxzhmm,kfgssq,mmsyzq,yxdlsbcs,bsxtsmmzq,kkglfx,khdhbz,yhdlm,yhmc,yhkl,yhjs,dwbh,xb,csrq,dh,email,zz,bz,zwbm,ckjgbz,zdyhbz,kdlxtbz,bjjb,sjsbh,ssfgs,kkbbz,sjxzbz,sbsj,xbsj,ipxzbz,ipdz,wkxzbz,wkdz,sqtszkcs ";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where  (ygbh='"+whereygbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sqtszkcs=rs.getInt("sqtszkcs");
		zdmll=rs.getDouble("zdmll");

		sfkdybj=cf.fillNull(rs.getString("sfkdybj"));
		sfyxzhmm=cf.fillNull(rs.getString("sfyxzhmm"));
		kfgssq=cf.fillNull(rs.getString("kfgssq"));
		mmsyzq=cf.fillNull(rs.getString("mmsyzq"));
		yxdlsbcs=cf.fillNull(rs.getString("yxdlsbcs"));
		bsxtsmmzq=cf.fillNull(rs.getString("bsxtsmmzq"));
		kkglfx=cf.fillNull(rs.getString("kkglfx"));
		khdhbz=cf.fillNull(rs.getString("khdhbz"));
		yhdlm=cf.fillNull(rs.getString("yhdlm"));
		yhmc=cf.fillNull(rs.getString("yhmc"));
		yhkl=cf.fillNull(rs.getString("yhkl"));
		yhjs=cf.fillNull(rs.getString("yhjs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		xb=cf.fillNull(rs.getString("xb"));
		csrq=cf.fillNull(rs.getDate("csrq"));
		dh=cf.fillNull(rs.getString("dh"));
		email=cf.fillNull(rs.getString("email"));
		zz=cf.fillNull(rs.getString("zz"));
		bz=cf.fillNull(rs.getString("bz"));

		zwbm=cf.fillNull(rs.getString("zwbm"));
		ckjgbz=cf.fillNull(rs.getString("ckjgbz"));
		zdyhbz=cf.fillNull(rs.getString("zdyhbz"));
		kdlxtbz=cf.fillNull(rs.getString("kdlxtbz"));
		bjjb=cf.fillNull(rs.getString("bjjb"));
		sjsbh=cf.fillNull(rs.getString("sjsbh"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		kkbbz=cf.fillNull(rs.getString("kkbbz"));

		sjxzbz=cf.fillNull(rs.getString("sjxzbz"));
		sbsj=cf.fillNull(rs.getString("sbsj"));
		xbsj=cf.fillNull(rs.getString("xbsj"));
		ipxzbz=cf.fillNull(rs.getString("ipxzbz"));
		ipdz=cf.fillNull(rs.getString("ipdz"));
		wkxzbz=cf.fillNull(rs.getString("wkxzbz"));
		wkdz=cf.fillNull(rs.getString("wkdz"));

		if (kkglfx.equals(""))
		{
			kkglfx="N";
		}
		if (yhkl.equals(""))
		{
			yhkl="111111";
			mmsyzq="90";
			yxdlsbcs="5";
			bsxtsmmzq="15";
		}

		if (sfyxzhmm.equals(""))
		{
			sfyxzhmm="N";
		}
	
	}
	rs.close();
	ps.close();

	if (kfgssq.equals("1") )//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		sqxz1Style="display:block";
		sqxz2Style="display:none";
		sqxz3Style="display:none";
		sqxz4Style="display:none";
		sqxz5Style="display:none";
	}
	else if ( kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		sqxz1Style="display:none";
		sqxz2Style="display:block";
		sqxz3Style="display:none";
		sqxz4Style="display:none";
		sqxz5Style="display:none";
	}
	else if (kfgssq.equals("3") )
	{
		sqxz1Style="display:none";
		sqxz2Style="display:none";
		sqxz3Style="display:block";
		sqxz4Style="display:none";
		sqxz5Style="display:none";
	}
	else if ( kfgssq.equals("4") )
	{
		sqxz1Style="display:none";
		sqxz2Style="display:none";
		sqxz3Style="display:none";
		sqxz4Style="display:block";
		sqxz5Style="display:none";
	}
	else if ( kfgssq.equals("5"))
	{
		sqxz1Style="display:none";
		sqxz2Style="display:none";
		sqxz3Style="display:none";
		sqxz4Style="display:none";
		sqxz5Style="display:block";
	}
	else 
	{
		sqxz1Style="display:none";
		sqxz2Style="display:none";
		sqxz3Style="display:none";
		sqxz4Style="display:none";
		sqxz5Style="display:none";
	}


	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+dwbh+"'";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();


	String bjjbbm=null;
	String bjjbmc=null;
	ls_sql="select bjjbbm,bjjbmc ";
	ls_sql+=" from  bdm_bjjbbm";
	ls_sql+=" order by bjjbbm";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	while (rs.next())
	{
		bjjbbm=cf.fillNull(rs.getString("bjjbbm"));
		bjjbmc=cf.fillNull(rs.getString("bjjbmc"));

		int count=0;
		ls_sql="select count(*)";
		ls_sql+=" from  bj_jzbjb";
		ls_sql+=" where dqbm='"+dqbm+"' and bjjbbm='"+bjjbbm+"'";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();
		if (count>0)
		{
			bjjbmc=bjjbmc+"���б��ۣ�";
		}
	
		ls_sql="select count(*)";
		ls_sql+=" from  sq_sjsbjjb";
		ls_sql+=" where ygbh="+whereygbh+"  and bjjbbm='"+bjjbbm+"' ";
		ps1= conn.prepareStatement(ls_sql);
		rs1 =ps1.executeQuery();
		if (rs1.next())
		{
			count=rs1.getInt(1);
		}
		rs1.close();
		ps1.close();

		if (count>0)
		{
			sjsbjjb+="<option value='"+bjjbbm+"' SELECTED >"+bjjbmc+"</option>\r\n";
		}
		else
		{
			sjsbjjb+="<option value='"+bjjbbm+"'>"+bjjbmc+"</option>\r\n";
		}
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

<html>
<head>
<title>�޸���Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%">
  <tr>
    <td width="100%"> 
      <div align="center"> ϵͳ��Ȩ</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
			<tr> 
			  <td colspan="4" height="2"> 
				<div align="center"> 
				  <input type="button"  value="����" onClick="f_do(editform)">
				  <input type="reset"  value="����">
				  <input type="button"  value="ϵͳ��Ȩ" onClick="f_sq(editform)">
				  <input type="button"  value="��������" onClick="editform.yhkl.value='111111'">
				</div>			  </td>
			</tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>�����ֹ�˾</td>
              <td width="32%"> 
                <select name="ssfgs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+ssfgs+"'",ssfgs);
%> 
                </select>              </td>
              <td width="17%" align="right"><font color="#FF0000">*</font>������������</td>
              <td width="33%"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX"  >
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh);
%> 
              </select>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">��������С��</td>
              <td width="32%"> 
                <select name="sjsbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
		cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+sjsbh+"'",sjsbh);
%> 
                </select>              </td>
              <td width="17%" align="right">�û�����</td>
              <td width="33%"><%=yhmc%> </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>�û���½��</div>              </td>
              <td width="32%"> 
                <input type="text" name="yhdlm" size="20" maxlength="16"  value="<%=yhdlm%>" >              </td>
              <td width="17%"> 
              <div align="right"><font color="#FF0000">*</font><font color="#0000FF">�û�����</font></div>              </td>
              <td width="33%"> 
              <input type="text" name="yhkl" size="20" maxlength="50"  value="<%=yhkl%>" readonly>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right"><font color="#FF0000">*</font>�û���ɫ</div>              </td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="yhjs" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectToken(out,"A0+�ܲ�&A1+�ܲ�������&F0+�ֹ�˾&F1+�ֹ�˾������&F2+����",yhjs);
%> 
                </select>              </td>
              <td width="17%"> 
              <div align="right"><font color="#FF0000">*</font>�ص��û���־</div>              </td>
              <td width="33%"><%
	cf.radioToken(out, "zdyhbz","Y+�ص��û�&N+���ص��û�",zdyhbz);
%> </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�����۸���ϸ</td>
              <td><%
	cf.radioToken(out, "ckjgbz","Y+�ɿ�&N+���ɿ�",ckjgbz);
%></td>
              <td width="17%" rowspan="4" align="right">���ӱ���[�����շ���Ŀ]��Ȩ</td>
              <td width="33%" rowspan="4">
			  <select name="sfxmbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="6" multiple>
                <option value=""></option>
<%
	cf.mutilSelectItem(out,"select sfxmbm,sfxmmc from bdm_sfxmbm where dqbm='"+dqbm+"' and sfxsq='2' order by sfxmbm","select sfxmbm from sq_sfxmsq where ygbh='"+whereygbh+"'");
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�������Ϸ���</td>
              <td><%
	cf.radioToken(out, "kkglfx","Y+�ɿ�&N+���ɿ�",kkglfx);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0000">*</font>�Ƿ�ɴ�ӡ����</td>
              <td><%
	cf.radioToken(out, "sfkdybj","Y+����Ȩ��ӡ&N+������Ȩ��ӡ&M+���ܴ�ӡ",sfkdybj);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>�����ͻ��绰</td>
              <td width="32%"><%
	cf.radioToken(out, "khdhbz","N+���ɿ�&Y+�ɿ�",khdhbz);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>�ɿ�����־</td>
              <td width="32%" bgcolor="#CCCCFF"><%
	cf.radioToken(out, "kkbbz","Y+�ɿ���&N+���ɿ���",kkbbz);
%></td>
              <td rowspan="3" align="right">���ʦ���ۼ���</td>
              <td rowspan="3"> 
                <select name="bjjbbm" style="FONT-SIZE:12PX;WIDTH:152PX" size="5" multiple>
                  <option value=""></option>
                  <%=sjsbjjb%> 
                </select>              </td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>����</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="zwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zwbm,zwmc from dm_zwbm order by zwbm",zwbm);
%> 
                </select>              </td>
            </tr>
            
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF"><font color="#FF0000">*</font>�Ƿ������һ�����</td>
              <td width="32%"><%
	cf.radioToken(out, "sfyxzhmm","Y+����&N+��",sfyxzhmm);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" height="22" bgcolor="#CCCCFF"><font color="#FF0000">*</font>�ɵ�½ϵͳ��־</td>
              <td width="32%" height="22" bgcolor="#CCCCFF"><%
	cf.radioToken(out, "kdlxtbz","Y+�ɵ�½&N+���ɵ�½",kdlxtbz);
%></td>
              <td rowspan="11" align="right" bgcolor="#CCFFFF"><font color="#FF0000">*</font>�ͻ�������Ȩ��Χ </td>
              <td rowspan="4" height="22" bgcolor="#CCFFFF"> 
                <input type="radio" name="kfgssq" value="0" <% if (kfgssq.equals("0")) out.print("checked");%> onClick="sqxz1.style.display ='none';sqxz2.style.display ='none';sqxz3.style.display ='none';sqxz4.style.display ='none';sqxz5.style.display ='none';">
                ����Ȩ<BR>
                <input type="radio" name="kfgssq" value="1" <% if (kfgssq.equals("1")) out.print("checked");%> onClick="sqxz1.style.display ='block';sqxz2.style.display ='none';sqxz3.style.display ='none';sqxz4.style.display ='none';sqxz5.style.display ='none';">
                ��Ȩ�����ֹ�˾<BR>
                <input type="radio" name="kfgssq" value="2" <% if (kfgssq.equals("2")) out.print("checked");%> onClick="sqxz1.style.display ='none';sqxz2.style.display ='block';sqxz3.style.display ='none';sqxz4.style.display ='none';sqxz5.style.display ='none';">
                ��Ȩ����ֹ�˾<BR>
                <input type="radio" name="kfgssq" value="3" <% if (kfgssq.equals("3")) out.print("checked");%> onClick="sqxz1.style.display ='none';sqxz2.style.display ='none';sqxz3.style.display ='block';sqxz4.style.display ='none';sqxz5.style.display ='none';">
                ��Ȩ��������<BR>
                <input type="radio" name="kfgssq" value="4" <% if (kfgssq.equals("4")) out.print("checked");%> onClick="sqxz1.style.display ='none';sqxz2.style.display ='none';sqxz3.style.display ='none';sqxz4.style.display ='block';sqxz5.style.display ='none';">
                ��Ȩĳһ�ֹ�˾�������<BR>
                <input type="radio" name="kfgssq" value="5" <% if (kfgssq.equals("5")) out.print("checked");%> onClick="sqxz1.style.display ='none';sqxz2.style.display ='none';sqxz3.style.display ='none';sqxz4.style.display ='none';sqxz5.style.display ='block';">
                ��Ȩ����ֹ�˾������� </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>ʱ�����Ʊ�־</td>
              <td width="32%"><%
	cf.radioToken(out, "sjxzbz","Y+����&N+������",sjxzbz);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�ϰ�ʱ��</td>
              <td width="32%"> 
                <input type="text" name="sbsj" size="10" maxlength="8"  value="<%=sbsj%>" >
                ��24Сʱ������ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">�°�ʱ��</td>
              <td width="32%"> 
                <input type="text" name="xbsj" size="10" maxlength="8"  value="<%=xbsj%>" >
                ��24Сʱ������ </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>IP��ַ���Ʊ�־</td>
              <td width="32%"><%
	cf.radioToken(out, "ipxzbz","Y+����&N+������",ipxzbz);
%></td>
              <td rowspan="7" bgcolor="#CCFFFF">

                <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="sqxz1" style="<%=sqxz1Style%>">
                  <tr > 
                    <td > 
                      <select name="sqxz1Value" style="FONT-SIZE:12PX;WIDTH:252PX" size="15" multiple>
                        <%
	cf.mutilSelectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','��������') from sq_dwxx where dwbh='"+ssfgs+"'","select ssfgs from sq_sqfgs where ygbh='"+whereygbh+"'");
						%> 
                      </select>                    </td>
                  </tr>
                </table>

                <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="sqxz2" style="<%=sqxz2Style%>">
                  <tr > 
                    <td > 
                      <select name="sqxz2Value" style="FONT-SIZE:12PX;WIDTH:252PX" size="15" multiple>
                        <%
	cf.mutilSelectItem(out,"select dwbh,dwmc||DECODE(cxbz,'N','','Y','��������') from sq_dwxx where dwlx in('A0','F0') order by cxbz,dwbh","select ssfgs from sq_sqfgs where ygbh='"+whereygbh+"'");
						%> 
                      </select>                    </td>
                  </tr>
                </table>



                <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="sqxz3" style="<%=sqxz3Style%>">
                  <tr > 
                    <td > 
                      <select name="sqxz3Value" style="FONT-SIZE:12PX;WIDTH:252PX" size="15" multiple>
                        <%
		cf.mutilSelectItem(out,"select a.dwbh,a.dwmc||'��'||b.dwmc||'��'||DECODE(a.cxbz,'N','','Y','��������') from sq_dwxx a,sq_dwxx b where a.ssfgs=b.dwbh and a.dwlx in('F2') and a.ssfgs='"+ssfgs+"'  order by a.ssfgs,a.cxbz,a.dwlx,a.dwbh","select dwbh from sq_sqbm where ygbh='"+whereygbh+"'");
						%> 
                      </select>                    </td>
                  </tr>
                </table>



                <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="sqxz4" style="<%=sqxz4Style%>">
                  <tr > 
                    <td > 
                      <select name="sqxz4Value" style="FONT-SIZE:12PX;WIDTH:252PX" size="15" multiple>
                        <%
		cf.mutilSelectItem(out,"select a.dwbh,a.dwmc||'��'||b.dwmc||'��'||DECODE(a.cxbz,'N','','Y','��������') from sq_dwxx a,sq_dwxx b where a.ssfgs=b.dwbh and a.dwlx in('F2') and a.ssfgs='"+ssfgs+"'  order by a.ssfgs,a.cxbz,a.dwlx,a.dwbh","select dwbh from sq_sqbm where ygbh='"+whereygbh+"'");
						%> 
                      </select>                    </td>
                  </tr>
                </table>


                <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="sqxz5" style="<%=sqxz5Style%>">
                  <tr > 
                    <td > 
                      <select name="sqxz5Value" style="FONT-SIZE:12PX;WIDTH:252PX" size="15" multiple>
                        <%
	if (dlyhjs.equals("A0") || dlyhjs.equals("A1"))
	{
		cf.mutilSelectItem(out,"select a.dwbh,a.dwmc||'��'||b.dwmc||'��'||DECODE(a.cxbz,'N','','Y','��������') from sq_dwxx a,sq_dwxx b where a.ssfgs=b.dwbh and a.dwlx in('F2') order by a.ssfgs,a.cxbz,a.dwlx,a.dwbh","select dwbh from sq_sqbm where ygbh='"+whereygbh+"'");
	}
	else{
		cf.mutilSelectItem(out,"select a.dwbh,a.dwmc||'��'||b.dwmc||'��'||DECODE(a.cxbz,'N','','Y','��������') from sq_dwxx a,sq_dwxx b where a.ssfgs=b.dwbh and a.dwlx in('F2') and a.ssfgs='"+ssfgs+"'  order by a.ssfgs,a.cxbz,a.dwlx,a.dwbh","select dwbh from sq_sqbm where ygbh='"+whereygbh+"'");
	}
						%> 
                      </select>                    </td>
                  </tr>
                </table>			  </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right" bgcolor="#FFFFFF">IP��ַ</td>
              <td width="32%"> 
                <input type="text" name="ipdz" size="20" maxlength="20"  value="<%=ipdz%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>������ַ���Ʊ�־</td>
              <td width="32%"><%
	cf.radioToken(out, "wkxzbz","Y+����&N+������",wkxzbz);
%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">������ַ</td>
              <td width="32%"> 
                <input type="text" name="wkdz" size="20" maxlength="20"  value="<%=wkdz%>" >              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>����ʹ������</td>
              <td width="32%"> 
                <input type="text" name="mmsyzq" size="10" maxlength="16"  value="<%=mmsyzq%>" >
                �� <br>
                <b><font color="#0000CC">����ʹ�ó������ʱ��ǿ���޸�����</font></b> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>�����½ʧ�ܴ���</td>
              <td width="32%"> 
                <input type="text" name="yxdlsbcs" size="10" maxlength="16"  value="<%=yxdlsbcs%>" >
                <font color="#0000CC"><b>������½ʧ�ܺ����ʺ�</b></font> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#FF0000">*</font>����ϵͳ����������</td>
              <td width="32%"> 
                <input type="text" name="bsxtsmmzq" size="10" maxlength="16"  value="<%=bsxtsmmzq%>" >
                �� <br>
                <font color="#0000CC"><b>����һ��ʱ�䲻��ϵͳ�Զ����ʺ�</b></font> </td>
            </tr>
            <tr> 
              <td colspan="4" height="2"> 
                <div align="center"> 
                  <input type="hidden" name="whereygbh"  value="<%=whereygbh%>" >
                  <input type="button"  value="����" onClick="f_do(editform)">
                  <input type="reset"  value="����">
                  <input type="button"  value="ϵͳ��Ȩ" onClick="f_sq(editform)" name="button">
                  <input type="button"  value="��������" onClick="editform.yhkl.value='111111'">
                </div>              </td>
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
function f_do(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yhjs)=="") {
		alert("��ѡ��[�û���ɫ]��");
		FormName.yhjs.focus();
		return false;
	}
	if(	javaTrim(FormName.dwbh)=="") {
		alert("��ѡ��[������λ���]��");
		FormName.dwbh.focus();
		return false;
	}
	if(	!radioChecked(FormName.ckjgbz)) {
		alert("��ѡ��[����鿴�۸���ϸ]��");
		FormName.ckjgbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.zdyhbz)) {
		alert("��ѡ��[�ص��û���־]��");
		FormName.zdyhbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.kkbbz)) {
		alert("��ѡ��[�ɿ�����־]��");
		FormName.kkbbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.kdlxtbz)) {
		alert("��ѡ��[�ɵ�½ϵͳ��־]��");
		FormName.kdlxtbz[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.khdhbz)) {
		alert("��ѡ��[�鿴�ͻ��绰��־]��");
		FormName.khdhbz[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfyxzhmm)) {
		alert("��ѡ��[�Ƿ������һ�����]��");
		FormName.sfyxzhmm[0].focus();
		return false;
	}
/*	
	if (FormName.kdlxtbz[0].checked)
	{
		if(	javaTrim(FormName.yhdlm)=="") {
			alert("������[�û���½��]��");
			FormName.yhdlm.focus();
			return false;
		}
		if(	javaTrim(FormName.yhkl)=="") {
			alert("������[�û�����]��");
			FormName.yhkl.focus();
			return false;
		}
	}
	else{
		if(	javaTrim(FormName.yhdlm)!="") {
			alert("��ȡ��[�û���½��]��");
			FormName.yhdlm.focus();
			return false;
		}
		if(	javaTrim(FormName.yhkl)!="") {
			alert("��ȡ��[�û�����]��");
			FormName.yhkl.focus();
			return false;
		}
	}
*/


	if(	javaTrim(FormName.zwbm)=="") {
		alert("��ѡ��[����]��");
		FormName.zwbm.focus();
		return false;
	}
	if(	!radioChecked(FormName.sjxzbz)) {
		alert("��ѡ��[ʱ�����Ʊ�־]��");
		FormName.sjxzbz[0].focus();
		return false;
	}
	if (FormName.sjxzbz[0].checked)
	{
		if(	javaTrim(FormName.sbsj)=="") {
			alert("��ѡ��[�ϰ�ʱ��]��");
			FormName.sbsj.focus();
			return false;
		}
		if(!(isNumber(FormName.sbsj, "�ϰ�ʱ��"))) {
			return false;
		}
		if(	javaTrim(FormName.xbsj)=="") {
			alert("��ѡ��[�°�ʱ��]��");
			FormName.xbsj.focus();
			return false;
		}
		if(!(isNumber(FormName.xbsj, "�°�ʱ��"))) {
			return false;
		}
	}
	if(	!radioChecked(FormName.ipxzbz)) {
		alert("��ѡ��[IP��ַ���Ʊ�־]��");
		FormName.ipxzbz[0].focus();
		return false;
	}
	if (FormName.ipxzbz[0].checked)
	{
		if(	javaTrim(FormName.ipdz)=="") {
			alert("��ѡ��[IP��ַ]��");
			FormName.ipdz.focus();
			return false;
		}
	}
	if(	!radioChecked(FormName.wkxzbz)) {
		alert("��ѡ��[������ַ���Ʊ�־]��");
		FormName.wkxzbz[0].focus();
		return false;
	}
	if (FormName.wkxzbz[0].checked)
	{
		if(	javaTrim(FormName.wkdz)=="") {
			alert("��ѡ��[������ַ]��");
			FormName.wkdz.focus();
			return false;
		}
	}
	if(	javaTrim(FormName.mmsyzq)=="") {
		alert("������[����ʹ������]��");
		FormName.mmsyzq.focus();
		return false;
	}
	if(!(isInt(FormName.mmsyzq, "����ʹ������"))) {
		return false;
	}
	if(	javaTrim(FormName.yxdlsbcs)=="") {
		alert("������[�����½ʧ�ܴ���]��");
		FormName.yxdlsbcs.focus();
		return false;
	}
	if(!(isInt(FormName.yxdlsbcs, "�����½ʧ�ܴ���"))) {
		return false;
	}
	if(	javaTrim(FormName.bsxtsmmzq)=="") {
		alert("������[����ϵͳ����������]��");
		FormName.bsxtsmmzq.focus();
		return false;
	}
	if(!(isInt(FormName.bsxtsmmzq, "����ϵͳ����������"))) {
		return false;
	}


	if(	!radioChecked(FormName.kfgssq)) {
		alert("��ѡ��[�ͻ�������Ȩ��Χ]��");
		FormName.kfgssq[0].focus();
		return false;
	}

	if (FormName.kfgssq[1].checked  )//�������б�ѡ
	{
		if(	!selectChecked(FormName.sqxz1Value)) {
			alert("��ѡ��[��Ȩ�ֹ�˾]��");
			FormName.sqxz1Value.focus();
			return false;
		}
	}
	else if ( FormName.kfgssq[2].checked)//�������б�ѡ
	{
		if(	!selectChecked(FormName.sqxz2Value)) {
			alert("��ѡ��[��Ȩ�ֹ�˾]��");
			FormName.sqxz2Value.focus();
			return false;
		}
	}
	else if (FormName.kfgssq[3].checked  )//�������б�ѡ
	{
		if(	!selectChecked(FormName.sqxz3Value)) {
			alert("��ѡ��[��Ȩ����]��");
			FormName.sqxz3Value.focus();
			return false;
		}
	}
	else if ( FormName.kfgssq[4].checked )//�������б�ѡ
	{
		if(	!selectChecked(FormName.sqxz4Value)) {
			alert("��ѡ��[��Ȩ����]��");
			FormName.sqxz4Value.focus();
			return false;
		}
	}
	else if ( FormName.kfgssq[5].checked)//�������б�ѡ
	{
		if(	!selectChecked(FormName.sqxz5Value)) {
			alert("��ѡ��[��Ȩ����]��");
			FormName.sqxz5Value.focus();
			return false;
		}
	}
	if(	!radioChecked(FormName.sfkdybj)) {
		alert("��ѡ��[�Ƿ�ɴ�ӡ����]��");
		FormName.sfkdybj[0].focus();
		return false;
	}



	FormName.action="SaveEditSq_yhxx.jsp";
	FormName.submit();
	return true;
}
function f_sq(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.yhdlm)=="") {
		alert("������[�û���½��]��");
		FormName.yhdlm.focus();
		return false;
	}

	FormName.action="/xtsq/xtsq/grouptouserCj.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
