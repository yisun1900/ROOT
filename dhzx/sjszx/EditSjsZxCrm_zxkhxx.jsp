<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='java.sql.*,java.io.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>


<%
String yhdlm=(String)session.getAttribute("yhdlm");

String dqbm=null;
String khxm=null;
String xb=null;
String fwdz=null;
String lxfs=null;
String fwlxbm=null;
String hxbm=null;
String fwmj=null;
String fgyqbm=null;
String zxysbm=null;
String zxdm=null;
String sfxhf=null;
String hfrq=null;
String hdbz=null;
String khlxbm=null;
String bz=null;

String cqbm=null;
String cgdz=null;
String hdr=null;
String zxzt=null;
String zxdjbm=null;

String lrr=null;
String dwbh=null;
String zxsj=null;
String lrsj=null;
String zxjg=null;
String sbyybm=null;

String sjs="";
String zxqk="";
String newzxjlh=null;
String bjjb=null;
String lfsj=null;
String ctbz=null;
String ctsj=null;
String lfbz=null;
String jzbz=null;
String xqbm=null;
String louhao=null;
String sfzdzbj=null;

String nlqjbm=null;
String zybm=null;
String fj=null;
String yjzxsj=null;
String ywy=null;
String ssfgs=null;
String rddqbm=null;
String hxwzbm=null;
String ysrbm=null;

String xfwdz=null;
String email=null;
String czrkbm=null;
String jtjgbm=null;
String lcbm=null;
String cxbm=null;
String cgbm=null;
String scqxbm=null;
int zxzc=0;
int hqpszc=0;
int jjzczc=0;
int jdzj=0;
String cxhdbm=null;
String fjfwbm=null;
String fwytbm=null;
String qtdh=null;
String cxhdbmxq=null;
String cxhdbmzh=null;
String cxgtbz=null;
String cxgtsj=null;
String csgtbz=null;
String csgtsj=null;
String ysshbz="";
String ysshsj=null;
String ysshr=null;
String ysshyj=null;
String bjdysq=null;
String tcmc=null;
String bjbbh=null;
String ysy=null;
String zcsfss=null;
String sfyckh=null;

String sfkdybj="";
String printMark="disabled";

String khbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
String ls_sql=null;
try {
	conn=cf.getConnection();

	ls_sql="select sfyckh,sjs,zcsfss,ysy,bjbbh,bjdysq,ysshbz,ysshsj,ysshr,ysshyj,cxgtbz,cxgtsj,csgtbz,csgtsj,cxhdbmxq,cxhdbmzh,qtdh,fwytbm,fjfwbm,cxhdbm,zxjlh,xfwdz,email,czrkbm,jtjgbm,lcbm,cxbm,cgbm,scqxbm,zxzc,hqpszc,jjzczc,jdzj,nlqjbm,zybm,fj,yjzxsj,ywy,ssfgs,rddqbm,hxwzbm,ysrbm  ,sfzdzbj,louhao,xqbm,jzbz,lfsj,ctsj,lfbz,ctbz,bjjb,DECODE(crm_zxkhxx.zxzt,'0','δ�������','1','�������','2','���ʦ�ύ�ɵ�','3','��ǩԼ','4','�ɵ�','5','�ɵ����δͨ��') zxzt,zxdjbm,khxm,xb,fwdz,lxfs,fwlxbm,hxbm,fwmj,fgyqbm,zxysbm,zxdm,sbyybm,sfxhf,hfrq,hdbz,khlxbm,bz,cqbm,cgdz,hdr";
	ls_sql+=" ,crm_zxkhxx.tcmc";
	ls_sql+=" from  crm_zxkhxx";
	ls_sql+=" where  (khbh='"+khbh+"')  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfyckh=cf.fillNull(rs.getString("sfyckh"));
		sjs=cf.fillNull(rs.getString("sjs"));
		zcsfss=cf.fillNull(rs.getString("zcsfss"));
		ysy=cf.fillNull(rs.getString("ysy"));
		bjbbh=cf.fillNull(rs.getString("bjbbh"));
		tcmc=cf.fillNull(rs.getString("tcmc"));
		bjdysq=cf.fillNull(rs.getString("bjdysq"));
		ysshbz=cf.fillNull(rs.getString("ysshbz"));
		ysshsj=cf.fillNull(rs.getDate("ysshsj"));
		ysshr=cf.fillNull(rs.getString("ysshr"));
		ysshyj=cf.fillNull(rs.getString("ysshyj"));
		cxgtbz=cf.fillNull(rs.getString("cxgtbz"));
		cxgtsj=cf.fillNull(rs.getDate("cxgtsj"));
		csgtbz=cf.fillNull(rs.getString("csgtbz"));
		csgtsj=cf.fillNull(rs.getDate("csgtsj"));

		cxhdbmxq=cf.fillNull(rs.getString("cxhdbmxq"));
		cxhdbmzh=cf.fillNull(rs.getString("cxhdbmzh"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		fwytbm=cf.fillNull(rs.getString("fwytbm"));
		fjfwbm=cf.fillNull(rs.getString("fjfwbm"));
		cxhdbm=cf.fillNull(rs.getString("cxhdbm"));
		newzxjlh=cf.fillNull(rs.getString("zxjlh"));
		xfwdz=cf.fillNull(rs.getString("xfwdz"));
		email=cf.fillNull(rs.getString("email"));
		czrkbm=cf.fillNull(rs.getString("czrkbm"));
		jtjgbm=cf.fillNull(rs.getString("jtjgbm"));
		lcbm=cf.fillNull(rs.getString("lcbm"));
		cxbm=cf.fillNull(rs.getString("cxbm"));
		cgbm=cf.fillNull(rs.getString("cgbm"));
		scqxbm=cf.fillNull(rs.getString("scqxbm"));
		zxzc=rs.getInt("zxzc");
		hqpszc=rs.getInt("hqpszc");
		jjzczc=rs.getInt("jjzczc");
		jdzj=rs.getInt("jdzj");

		nlqjbm=cf.fillNull(rs.getString("nlqjbm"));
		zybm=cf.fillNull(rs.getString("zybm"));
		fj=cf.fillNull(rs.getString("fj"));
		yjzxsj=cf.fillNull(rs.getDate("yjzxsj"));
		ywy=cf.fillNull(rs.getString("ywy"));
		ssfgs=cf.fillNull(rs.getString("ssfgs"));
		rddqbm=cf.fillNull(rs.getString("rddqbm"));
		hxwzbm=cf.fillNull(rs.getString("hxwzbm"));
		ysrbm=cf.fillNull(rs.getString("ysrbm"));

		sfzdzbj=cf.fillNull(rs.getString("sfzdzbj"));
		louhao=cf.fillNull(rs.getString("louhao"));
		xqbm=cf.fillNull(rs.getString("xqbm"));
		jzbz=cf.fillNull(rs.getString("jzbz"));
		lfsj=cf.fillNull(rs.getDate("lfsj"));
		ctsj=cf.fillNull(rs.getDate("ctsj"));
		lfbz=rs.getString("lfbz");
		ctbz=rs.getString("ctbz");
		bjjb=rs.getString("bjjb");

		zxzt=cf.fillNull(rs.getString("zxzt"));
		zxdjbm=cf.fillNull(rs.getString("zxdjbm"));
		khxm=cf.fillNull(rs.getString("khxm"));
		xb=cf.fillNull(rs.getString("xb"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		fwlxbm=cf.fillNull(rs.getString("fwlxbm"));
		hxbm=cf.fillNull(rs.getString("hxbm"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
		fgyqbm=cf.fillNull(rs.getString("fgyqbm"));
		zxysbm=cf.fillNull(rs.getString("zxysbm"));
		zxdm=cf.fillNull(rs.getString("zxdm"));
		sbyybm=cf.fillNull(rs.getString("sbyybm"));
		sfxhf=cf.fillNull(rs.getString("sfxhf"));
		hfrq=cf.fillNull(rs.getDate("hfrq"));
		hdbz=cf.fillNull(rs.getString("hdbz"));
		khlxbm=cf.fillNull(rs.getString("khlxbm"));
		bz=cf.fillNull(rs.getString("bz"));

		cqbm=cf.fillNull(rs.getString("cqbm"));
		cgdz=cf.fillNull(rs.getString("cgdz"));
		hdr=cf.fillNull(rs.getString("hdr"));
	}
	rs.close();
	ps.close();

	ls_sql="select zxsj,lrr,lrsj,zxqk";
	ls_sql+=" from  crm_sjszxqk";
	ls_sql+=" where zxjlh='"+newzxjlh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		lrr=rs.getString("lrr");
		zxqk=rs.getString("zxqk");
		zxsj=cf.fillNull(rs.getDate("zxsj"));
		lrsj=cf.fillNull(rs.getDate("lrsj"));
	}
	rs.close();
	ps.close();

	ls_sql="select dqbm";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		dqbm=cf.fillNull(rs.getString("dqbm"));
	}
	rs.close();
	ps.close();


	if (!bjdysq.equals("1"))
	{
		bjdysq="disabled";
	}
	else{
		bjdysq="";
	}

	ls_sql="select sfkdybj";
	ls_sql+=" from  sq_yhxx";
	ls_sql+=" where yhdlm='"+yhdlm+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs =ps.executeQuery();
	if (rs.next())
	{
		sfkdybj=cf.fillNull(rs.getString("sfkdybj"));//�Ƿ�ɴ�ӡ����:Y���ǣ�N����
	}
	rs.close();
	ps.close();

	sfkdybj="Y";

	if (sfkdybj.equals("Y"))
	{
		printMark="";
	}

	if (ysshbz.equals("B"))//N��δ���룻B��������ˣ�C���������룻Y�����ͨ����M�����δͨ��
	{
		out.println("������������ˣ��������޸ı���");
		return;
	}
	else if (ysshbz.equals("C"))
	{
		out.println("�������������룬�������޸ı���");
		return;
	}
	else if (ysshbz.equals("Y"))
	{
		out.println("���������ͨ�����������޸ı���");
		return;
	}


	if (!bjbbh.equals(""))
	{
		String sfzybb="";
		ls_sql="select sfzybb";
		ls_sql+=" from  bj_dzbjbb";
		ls_sql+=" where dqbm='"+dqbm+"' and bjbbh='"+bjbbh+"'  ";
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			sfzybb=rs.getString (1);
		}
		else{
			out.println("���󣡰汾�����ڣ�"+bjbbh);
			return;
		}
		rs.close();
		ps.close();

		if (sfzybb.equals("4"))//1��δ���ã�2����ǰ�棻3�����ð棻4����ͣ��
		{
			String getbjbbh="";
			ls_sql="select bjbbh";
			ls_sql+=" from  crm_bjbbsqjl";
			ls_sql+=" where khbh='"+khbh+"'";
			ps= conn.prepareStatement(ls_sql);
			rs =ps.executeQuery();
			if (rs.next())
			{
				getbjbbh=rs.getString (1);
			}
			rs.close();
			ps.close();

			if (!getbjbbh.equals(bjbbh))
			{
				out.println("���󣡰汾��ͣ�ã��������ʹ����������Ȩ");
				return;
			}
		}
	}
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<html>
<head>
<title>���ʦ��ѯ</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFFF">
<table width="100%" style="FONT-SIZE:12">
  <tr> 
    <td width="100%" > 
      <div align="center"> 
        <form method="post" action="" name="editform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4"><b><font color="#000066">���ʦ��ѯ�������ѯ��¼�ţ�<%=newzxjlh%>��</font></b></td>
            </tr>
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4" height="25">������Ϣ</td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000FF">�ͻ�����</font></div>              </td>
              <td width="32%"> 
              <input type="text" name="khxm" size="20" maxlength="50"  value="<%=khxm%>" readonly>              </td>
              <td width="18%"> 
              <div align="right"><font color="#CC0000">*</font>�Ա�</div>              </td>
              <td width="32%"> <%
	cf.radioToken(out, "xb","M+��&W+Ů",xb);
%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000FF">�ֻ�</font></td>
              <td colspan="3"> 
                <input type="text" name="lxfs" size="40" maxlength="50"  value="<%=lxfs%>" readonly>
                <font color="#FF0000">���ڽ��ն��ţ����¼һ��,�ж���绰<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�</font>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#0000FF">�����绰</font></td>
              <td colspan="3"> 
                <input type="text" name="qtdh" value="<%=qtdh%>" size="40" maxlength="50" readonly>
                <font color="#FF0000">(ע�⣺�ж���绰<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�)</font>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right">�����ʼ�</td>
              <td colspan="3"> 
                <input type="text" name="email" value="<%=email%>" size="40" maxlength="50">
                <font color="#FF0000">(ע�⣺�ж������<font color="#0000FF">��Ӣ�Ķ���</font>�ָ�)</font>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>��������</td>
              <td width="32%"> 
                <select name="nlqjbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select nlqjbm,nlqjmc from dm_nlqjbm order by nlqjbm",nlqjbm);
%> 
                </select>              </td>
              <td width="18%" align="right">ְҵ</td>
              <td width="32%"> 
                <select name="zybm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zybm,zymc from dm_zybm order by zybm",zybm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>��ס�˿�</td>
              <td width="32%"> 
                <select name="czrkbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select czrkbm,czrkmc from dm_czrkbm order by czrkbm",czrkbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>��ͥ�ṹ</td>
              <td width="32%"> 
                <select name="jtjgbm" style="FONT-SIZE:12PX;WIDTH:152PX" >
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select jtjgbm,jtjgmc from dm_jtjgbm order by jtjgbm",jtjgbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="18%" align="right" height="28">��ס��ַ</td>
              <td colspan="3" height="28"> 
                <input type="text" name="xfwdz" size="73" maxlength="100"  value="<%=xfwdz%>">              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000FF">װ�޷�����������</font></td>
              <td width="32%"> 
                <select name="cqbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="cf_fwdz(editform)">
                  <%
	cf.selectItem(out,"select cqbm,cqmc from dm_cqbm where cqbm='"+cqbm+"' order by cqbm",cqbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#0000FF">װ�޷���С��/�ֵ�</font></td>
              <td width="32%"> 
                <input type="text" name="xqbm" value="<%=xqbm%>" size="20" maxlength="50" onChange="cf_fwdz(editform)" readonly>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right" height="2"><font color="#CC0000">*</font><font color="#0000FF">װ�޷���¥��/���ƺ�</font></td>
              <td width="32%" height="2"> 
              <input type="text" name="louhao" value="<%=louhao%>" size="20" maxlength="50" onChange="cf_fwdz(editform)" readonly>              </td>
              <td colspan="2" height="2">ע�⣺<font color="#0000FF">װ�޷��ݵ�ַ</font>��������С����¥�ţ��Զ����ɣ�����¼��</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font><font color="#0000FF">װ�޷��ݵ�ַ</font></div>              </td>
              <td colspan="3"> 
                <input type="text" name="fwdz" size="73" maxlength="100"  value="<%=fwdz%>" readonly>              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">�μӹ�˾�����</td>
              <td colspan="3" bgcolor="#CCCCFF"><%=cxhdbm%>
              <input name="button3" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/EditCrm_zxkhxx.jsp?khbh=<%=khbh%>')"  value="�����">
              <input name="button4" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/InsertCrm_khzsxx.jsp?khbh=<%=khbh%>')"  value="�������Ϣ">
              <input name="button22" type="button" onClick="window.open('/dhzx/tqwh/xgcxhd/InsertCrm_khdjj.jsp?khbh=<%=khbh%>')"  value="��������ȯ"></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">�μ�С�������</td>
              <td colspan="3" bgcolor="#CCCCFF"><%=cxhdbmxq%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">�μ�չ������</td>
              <td colspan="3" bgcolor="#CCCCFF"><%=cxhdbmzh%></td>
            </tr>
            <tr bgcolor="#E8E8D4" align="center"> 
              <td colspan="4" height="26">���ݼ�����ȡ�����</td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>��������</div>              </td>
              <td width="32%"> 
                <select name="fwlxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwlxbm,fwlxmc from dm_fwlxbm order by fwlxbm",fwlxbm);
%> 
                </select>              </td>
              <td width="18%"> 
              <div align="right"><font color="#CC0000">*</font>Ԥ��װ��ʱ��</div>              </td>
              <td width="32%"> 
                <input type="text" name="yjzxsj" value="<%=yjzxsj%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>����</td>
              <td width="32%"> 
                <select name="hxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select hxbm,hxmc from dm_hxbm order by hxbm",hxbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>���ڽ������</td>
              <td width="32%"> 
                <input type="text" name="fwmj" size="20" maxlength="8"  value="<%=fwmj%>" >              </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>¥��</td>
              <td width="32%"> 
                <select name="lcbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select lcbm,lcmc from dm_lcbm order by lcbm",lcbm);
%> 
                </select>              </td>
              <td width="18%" align="right">����</td>
              <td width="32%"> 
                <select name="fjfwbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fjfwbm,fjfwmc from dm_fjfwbm order by fjfwbm",fjfwbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>����</td>
              <td width="32%"> 
                <select name="cxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cxbm,cxmc from dm_cxbm order by cxbm",cxbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>�ɹ�</td>
              <td width="32%"> 
                <select name="cgbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select cgbm,cgmc from dm_cgbm order by cgbm",cgbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="18%"> 
                <div align="right"><font color="#CC0000">*</font>׼��װ�޷��</div>              </td>
              <td width="32%"> 
                <select name="fgyqbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fgflbm,fgflmc from dm_fgflbm order by fgflbm",fgyqbm);
%> 
                </select>              </td>
              <td width="18%"> 
              <div align="right"><font color="#CC0000">*</font>ɫ��ȡ��</div>              </td>
              <td width="32%"> 
                <select name="scqxbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select scqxbm,scqxmc from dm_scqxbm order by scqxbm",scqxbm);
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8D4"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>������;</td>
              <td width="32%"> 
                <select name="fwytbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select fwytbm,fwytmc from dm_fwytbm order by fwytbm",fwytbm);
%> 
                </select>              </td>
              <td width="18%" align="right"><font color="#CC0000">*</font>�Ƿ�Զ�̿ͻ�</td>
              <td width="32%"><%
	cf.radioToken(out, "sfyckh","Y+��&N+��",sfyckh);
%></td>
            </tr>
            <tr bgcolor="#CCCCFF" align="center"> 
              <td colspan="4" height="29">�Ҿ����רҵ����</td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>װ����Ԥ��</td>
              <td width="32%" bgcolor="#CCCCFF"> 
                <select name="zxysbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select zxjwbm,zxjwmc from dm_zxjwbm order by zxjwbm",zxysbm);
%> 
                </select>              </td>
              <td width="18%" align="right" bgcolor="#CCCCFF">�ײ�����</td>
              <td width="32%"><%=tcmc%></td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right" bgcolor="#CCCCFF">װ��֧��</td>
              <td width="32%"> 
              <input type="text" name="zxzc" size="20" maxlength="16" value="<%=zxzc%>">              </td>
              <td width="18%" align="right">��������֧��</td>
              <td width="32%"> 
                <input type="text" name="hqpszc" size="20" maxlength="16" value="<%=hqpszc%>">              </td>
            </tr>
            <tr bgcolor="#CCCCFF"> 
              <td width="18%" align="right">�Ҿ�����֧��</td>
              <td width="32%"> 
              <input type="text" name="jjzczc" size="20" maxlength="16" value="<%=jjzczc%>">              </td>
              <td width="18%" align="right">�����ʽ�</td>
              <td width="32%"> 
                <input type="text" name="jdzj" size="20" maxlength="16" value="<%=jdzj%>">              </td>
            </tr>
            <tr bgcolor="#FFFFCC" align="center"> 
              <td colspan="4" height="29">���ʦ��ѯ���</td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right">Ԥ��Ա</td>
              <td><select name="ysy" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
					cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'��'||sq_yhxx.dh||'��' from sq_yhxx,sq_sqbm where sq_yhxx.ygbh=sq_sqbm.ygbh and sq_sqbm.dwbh='"+zxdm+"' and sq_yhxx.zwbm in('20') and sq_yhxx.sfzszg in('Y','N') order by yhmc",ysy);
				%>
              </select></td>
              <td align="right">���ʦ</td>
              <td><%=sjs%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right">Ԥ�����</td>
              <td><%
	cf.selectToken(out,"N+δ���&Y+���ͨ��&M+���δͨ��",ysshbz,true);
%></td>
              <td align="right"><font color="#CC0000">*</font>���۰汾��</td>
              <td><select name="bjbbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                <%
		cf.selectItem(out,"select bjbbh c1,bjbbh||'��'||dqmc||'����'||DECODE(bj_dzbjbb.sfzybb,'1','δ����','2','��ǰ��','3','���ð�','4','ͣ��')||'��' c2 from bj_dzbjbb,dm_dqbm where bj_dzbjbb.dqbm=dm_dqbm.dqbm and bj_dzbjbb.dqbm='"+dqbm+"' and bj_dzbjbb.bjbbh='"+bjbbh+"' order by bj_dzbjbb.dqbm,bjbbh",bjbbh);
%>
              </select></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right">Ԥ�������</td>
              <td><%=ysshr%></td>
              <td align="right">Ԥ�����ʱ��</td>
              <td><%=ysshsj%></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right">Ԥ��������</td>
              <td colspan="3"><%=ysshyj%></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>���ۼ���</td>
              <td width="32%"> 
                <select name="bjjb" style="FONT-SIZE:12PX;WIDTH:120PX">
                  <%
	if (bjjb!=null && !bjjb.equals(""))
	{
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm='"+bjjb+"'",bjjb);
	}
	else{
		out.println("<option value=\"\"></option>");
		cf.selectItem(out,"select bjjbbm,bjjbmc from bdm_bjjbbm where  bjjbbm in(select sq_sjsbjjb.bjjbbm from sq_sjsbjjb,sq_yhxx where sq_sjsbjjb.ygbh=sq_yhxx.ygbh and sq_yhxx.yhdlm='"+yhdlm+"') order by bjjbbm",bjjb);
	}
%> 
                </select>              </td>
              <td width="18%" align="right">��װ��־</td>
              <td width="32%"> <%
		if (sfzdzbj.equals("Y"))
		{
			cf.radioToken(out, "jzbz","1+��װ����&2+��װ����",jzbz,true);
		}
		else{
			cf.radioToken(out, "jzbz","1+��װ����&2+��װ����",jzbz);
		}
%> </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>������־</td>
              <td width="32%"><%
		cf.radioToken(out, "lfbz","N+δ����&Y+������",lfbz);
%></td>
              <td width="18%" align="right">����ʱ��</td>
              <td width="32%"> 
                <input type="text" name="lfsj" size="20" maxlength="20"  value="<%=lfsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right"><font color="#CC0000">*</font>��ƽ��ͼ��־</td>
              <td width="32%"> <%
		cf.radioToken(out, "ctbz","N+δ��ͼ&Y+�ѳ�ͼ",ctbz);
%> </td>
              <td width="18%" align="right">��ƽ��ͼʱ��</td>
              <td width="32%"> 
                <input type="text" name="ctsj" size="20" maxlength="20"  value="<%=ctsj%>" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#CC0000">*</font>��Ч��ͼ��־</td>
              <td><%
		cf.radioToken(out, "cxgtbz","N+δ��ͼ&Y+�ѳ�ͼ",cxgtbz);
%></td>
              <td align="right">��Ч��ͼʱ��</td>
              <td><input type="text" name="cxgtsj" size="20" maxlength="20"  value="<%=cxgtsj%>" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFCC">
              <td align="right"><font color="#CC0000">*</font>��ʩ��ͼ��־</td>
              <td><%
		cf.radioToken(out, "csgtbz","N+δ��ͼ&Y+�ѳ�ͼ",csgtbz);
%></td>
              <td align="right">��ʩ��ͼʱ��</td>
              <td><input type="text" name="csgtsj" size="20" maxlength="20"  value="<%=csgtsj%>" onDblClick="JSCalendar(this)"></td>
            </tr>
            <tr bgcolor="#FFFFCC"> 
              <td width="18%" align="right">��ѯ���</td>
              <td colspan="3"> 
                <textarea name="zxqk" cols="72" rows="4"><%=zxqk%></textarea>              </td>
            </tr>
            <tr> 
              <td colspan="4" > 
                <div align="center"> 
                    <input type="hidden" name="khbh" value="<%=khbh%>" readonly>
                    <input type="hidden" name="zcsfss"  value="<%=zcsfss%>" >
                    <input type="hidden" name="zxjlh"  value="<%=newzxjlh%>" >
                    <input type="hidden" name="dwbh"  value="<%=zxdm%>" >
                    <input type="hidden" name="sjs" value="<%=sjs%>" readonly>
                    <input type="hidden" name="zxsj" value="<%=cf.today()%>" >
                    <input type="hidden" name="lrr" value="<%=lrr%>" readonly>
                    <input type="hidden" name="lrsj" value="<%=cf.today()%>" readonly>

                    <input type="button"  value="����" onClick="f_do(editform)">
                    <input type="button"  value="ѡ����" onClick="f_lrfj(editform)" >
                    <input type="button"  value="�޸ķ���" onClick="f_xgfj(editform)">
                    <input type="button" onClick="f_xzxm(editform)"  value="ѡ������Ŀ">
                    <input type="button" onClick="f_fjxmpx(editform)"  value="����Ŀ˳��" >
                    <input type="button" onClick="f_ewlr(editform)"  value="ѡ�����շ�">
                    <input type="button" onClick="f_ewck(editform)"  value="�޸������շ�">
                    <p>
                    <input type="button" onClick="f_drmb(editform)"  value="���뱨��" >
                    <input type="button" onClick="f_bcmb(editform)"  value="�������Ϊ" >
                    <input type="button" onClick="f_excel(editform)"  value="��������" <%=bjdysq%>>
                    <input type="button" onClick="f_tbjjb(editform)"  value="�����ۼ���" >
                    <input name="button" type="button" onClick="f_tzk(editform)"  value="���ۿ�" >
                    <input type="button" onClick="f_dybj(editform)"  value="��ӡ����"  <%=printMark%>>
                    <input type="button" onClick="window.open('/zlkxt/loadWj.jsp?khbh=<%=khbh%>&khxm=<%=khxm%>')"  value="ͼֽ�ϴ�">
                    <input name="button2" type="button" onClick="window.open('/dhzx/yssh/InsertBj_ysshjl.jsp?khbh=<%=khbh%>')"  value="Ԥ�����">
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
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function cf_fwdz(FormName)
{  
	FormName.xqbm.value=strTrim(FormName.xqbm.value);
	FormName.louhao.value=strTrim(FormName.louhao.value);
	FormName.fwdz.value=FormName.cqbm.options[FormName.cqbm.selectedIndex].text+FormName.xqbm.value+FormName.louhao.value;
}      

function f_do(FormName)//����FormName:Form������
{
	//������Ϣ
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
	if(!(isEmail(FormName.email, "�����ʼ�"))) {
		return false;
	}
	if(	javaTrim(FormName.nlqjbm)=="") {
		alert("������[��������]��");
		FormName.nlqjbm.focus();
		return false;
	}
	if(	javaTrim(FormName.czrkbm)=="") {
		alert("������[��ס�˿�]��");
		FormName.czrkbm.focus();
		return false;
	}
	if(	javaTrim(FormName.jtjgbm)=="") {
		alert("������[��ͥ�ṹ]��");
		FormName.jtjgbm.focus();
		return false;
	}



	if(	javaTrim(FormName.cqbm)=="") {
		alert("������[��������]��");
		FormName.cqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.xqbm)=="") {
		alert("������[С��]��");
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


	//���ݼ�����ȡ�����
	if(	javaTrim(FormName.fwlxbm)=="") {
		alert("������[��������]��");
		FormName.fwlxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.yjzxsj)=="") {
		alert("������[Ԥ��װ��ʱ��]��");
		FormName.yjzxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.yjzxsj, "Ԥ��װ��ʱ��"))) {
		return false;
	}
	if(	javaTrim(FormName.hxbm)=="") {
		alert("������[����]��");
		FormName.hxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwmj)=="") {
		alert("������[���ڽ������]��");
		FormName.fwmj.focus();
		return false;
	}
	if(!(isNumber(FormName.fwmj, "���ڽ������"))) {
		return false;
	}
	if (FormName.fwmj.value=="0")
	{
		alert("[���ڽ������]����Ϊ0��");
		FormName.fwmj.select();
		return false;
	}


	if(	javaTrim(FormName.lcbm)=="") {
		alert("������[¥��]��");
		FormName.lcbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cxbm)=="") {
		alert("������[����]��");
		FormName.cxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.cgbm)=="") {
		alert("������[�ɹ�]��");
		FormName.cgbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fgyqbm)=="") {
		alert("������[׼��װ�޷��]��");
		FormName.fgyqbm.focus();
		return false;
	}
	if(	javaTrim(FormName.scqxbm)=="") {
		alert("������[ɫ��ȡ��]��");
		FormName.scqxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.fwytbm)=="") {
		alert("������[������;]��");
		FormName.fwytbm.focus();
		return false;
	}


	//�Ҿ����רҵ����
	if(	javaTrim(FormName.zxysbm)=="") {
		alert("������[װ����Ԥ��]��");
		FormName.zxysbm.focus();
		return false;
	}
	if(!(isNumber(FormName.zxzc, "װ��֧��"))) {
		return false;
	}
	if(!(isNumber(FormName.hqpszc, "��������֧��"))) {
		return false;
	}
	if(!(isNumber(FormName.jjzczc, "�Ҿ�����֧��"))) {
		return false;
	}
	if(!(isNumber(FormName.jdzj, "�����ʽ�"))) {
		return false;
	}

	if(	javaTrim(FormName.bjjb)=="") {
		alert("������[���ۼ���]��");
		FormName.bjjb.focus();
		return false;
	}
	if(	javaTrim(FormName.bjbbh)=="") {
		alert("������[���۰汾��]��");
		FormName.bjbbh.focus();
		return false;
	}


	//���ʦ��ѯ���
	if ("<%=sfzdzbj%>"=="Y")
	{
		if(!FormName.jzbz.checked) {
			alert("��ѡ��[��װ��־]��");
			FormName.jzbz.focus();
			return false;
		}
	}
	else
	{
		if(	!radioChecked(FormName.jzbz)) {
			alert("��ѡ��[��װ��־]��");
			FormName.jzbz[0].focus();
			return false;
		}
	}
	
	if(	!radioChecked(FormName.lfbz)) {
		alert("��ѡ��[������־]��");
		FormName.lfbz[0].focus();
		return false;
	}
	if (FormName.lfbz[1].checked)
	{
		if(	javaTrim(FormName.lfsj)=="") {
			alert("������[����ʱ��]��");
			FormName.lfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.lfsj, "����ʱ��"))) {
			return false;
		}
	}
	else{
		FormName.lfsj.value="";
	}

	if(	!radioChecked(FormName.ctbz)) {
		alert("��ѡ��[��ƽ��ͼ��־]��");
		FormName.ctbz[0].focus();
		return false;
	}
	if (FormName.ctbz[1].checked)
	{
		if(	javaTrim(FormName.ctsj)=="") {
			alert("������[��ƽ��ͼʱ��]��");
			FormName.ctsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.ctsj, "��ƽ��ͼʱ��"))) {
			return false;
		}
	}
	else{
		FormName.ctsj.value="";
	}
	if(	!radioChecked(FormName.cxgtbz)) {
		alert("��ѡ��[��Ч��ͼ��־]��");
		FormName.cxgtbz[0].focus();
		return false;
	}
	if (FormName.cxgtbz[1].checked)
	{
		if(	javaTrim(FormName.cxgtsj)=="") {
			alert("������[��Ч��ͼʱ��]��");
			FormName.cxgtsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.cxgtsj, "��Ч��ͼʱ��"))) {
			return false;
		}
	}
	else{
		FormName.cxgtsj.value="";
	}
	if(	!radioChecked(FormName.csgtbz)) {
		alert("��ѡ��[��ʩ��ͼ��־]��");
		FormName.csgtbz[0].focus();
		return false;
	}
	if (FormName.csgtbz[1].checked)
	{
		if(	javaTrim(FormName.csgtsj)=="") {
			alert("������[��ʩ��ͼʱ��]��");
			FormName.csgtsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.csgtsj, "��ʩ��ͼʱ��"))) {
			return false;
		}
	}
	else{
		FormName.csgtsj.value="";
	}



	//������Ϣ
	if(	javaTrim(FormName.zxsj)=="") {
		alert("������[��ѯʱ��]��");
		FormName.zxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.zxsj, "��ѯʱ��"))) {
		return false;
	}

/*	
	if(	!radioChecked(FormName.zcsfss)) {
		alert("������[�����Ƿ���˰]��");
		FormName.zcsfss[0].focus();
		return false;
	}
*/
	if(	!radioChecked(FormName.sfyckh)) {
		alert("��ѡ��[�Ƿ�Զ�̿ͻ� ]��");
		FormName.sfyckh[0].focus();
		return false;
	}


	FormName.action="SaveEditSjsZxCrm_zxkhxx.jsp";
	FormName.submit();
	return true;
}

function f_bcmb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/cwmb.jsp";
	FormName.submit();
	return true;
}
function f_lrfj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/ChooseBj_fjxx.jsp";
	FormName.submit();
	return true;
}

function f_xgfj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/EditBj_fjxx.jsp";
	FormName.submit();
	return true;
}

function f_ewlr(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/InsertBj_sfxmmx.jsp?dqbm=<%=dqbm%>";
	FormName.submit();
	return true;
}
function f_ewck(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/Bj_sfxmmxList.jsp";
	FormName.submit();
	return true;
}

function f_xzxm(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/bj_khbjmxMain.jsp?dqbm=<%=dqbm%>";
	FormName.submit();
	return true;
}

function f_excel(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/Bj_khbjmxExcelList.jsp?dqbm=<%=dqbm%>";
	FormName.submit();
	return true;
}

function f_dybj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}


	FormName.action="dybj.jsp?dqbm=<%=dqbm%>";

	FormName.submit();
	return true;
}

function f_drmb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	if(	javaTrim(FormName.bjjb)=="") {
		alert("������[���ۼ���]��");
		FormName.bjjb.focus();
		return false;
	}



	FormName.action="/dzbjone/zxbjmx/drmb.jsp?dqbm=<%=dqbm%>";
	FormName.submit();
	return true;
}

function f_edit(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="EditCrm_zxkhxx.jsp";
	FormName.submit();
	return true;
}

function f_tbjjb(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/EditAllBjjb.jsp";

	FormName.submit();
	return true;
}

function f_xmpx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	winOpen("/dzbjone/zxbjmx/TzXhBjxmList.jsp?khbh=<%=khbh%>",900,600,'YES',"NO");
}

function f_fjxmpx(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	winOpen("/dzbjone/zxbjmx/TzFjXhBjxmList.jsp?khbh=<%=khbh%>",900,600,'YES',"NO");
}
function f_xmdj(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	winOpen("/dzbjone/zxbjmx/TzDjBjxmList.jsp?khbh=<%=khbh%>",900,600,'YES',"NO");
}

function f_dxzk(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	window.open("/dzbjone/zxbjmx/Bj_sfxmmxZklList.jsp?khbh=<%=khbh%>");
}

function f_zjsl(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dzbjone/zxbjmx/zjtccl.jsp";
	FormName.submit();
	return true;
}

function f_tzk(FormName)//����FormName:Form������
{
	if(	javaTrim(FormName.khbh)=="") {
		alert("������[�ͻ����]��");
		FormName.khbh.focus();
		return false;
	}

	FormName.action="/dhzx/tzzk/index.jsp";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
