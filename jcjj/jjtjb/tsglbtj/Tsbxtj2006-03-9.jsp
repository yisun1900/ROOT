<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
//������ʾ�ϲ���

	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String ls_sql=null;
	String wheresql="";
	String sjfw=null;
	String sjfw2=null;

	sjfw=request.getParameter("sjfw");
	if (sjfw!=null)
	{
		if (!(sjfw.equals("")))	wheresql+="  and (crm_tsjl.slsj>=TO_DATE('"+sjfw+"','YYYY/MM/DD'))";
	}
	sjfw2=request.getParameter("sjfw2");
	if (sjfw2!=null)
	{
		if (!(sjfw2.equals("")))	wheresql+="  and (crm_tsjl.slsj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS'))";
	}

	String fgs=request.getParameter("fgs");
	String dwbh=request.getParameter("dwbh");
	if (fgs!=null)
	{
		if (!(fgs.equals("")))	wheresql+=" and  (crm_tsjl.slbm in(select dwbh from sq_dwxx where dwlx in('A0','A1','F0','F1','F2') and ssdw='"+fgs+"'))";
	}
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  crm_tsjl.slbm='"+dwbh+"'";
	}
	
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>�ͻ��Ҿ�Ͷ���ޱ���(<%=sjfw%>--<%=sjfw2%>)</B>
</CENTER>
<table border="1" width="150%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">���</td>
	<td  width="5%">���س̶�</td>
	<td  width="7%">�ͻ�����</td>
	<td  width="4%">��Դ</td>
	<td  width="12%">��ַ</td>
	<td  width="4%">���ʦ</td>
	<td  width="4%">ʩ����</td>
	<td  width="4%">�ʼ�Ա</td>
	<td  width="6%">�깤����</td>
	<td  width="16%">Ͷ�߱�������</td>
	<td  width="8%">Ͷ�߱��ޱ�ע</td>
	<td  width="18%">�������</td>
	<td  width="18%">����״̬</td>
	<td  width="18%">������</td>
	<td  width="18%">����ʱ��</td>
	<td  width="18%">Ͷ��Ʒ��</td>
	<td  width="5%">���β���</td>
	<td  width="5%">ԭ��</td>
</tr>
<%

	ls_sql=" SELECT rownum,yzcdmc,khxm,slfsmc,fwdz,sjs,sgd,zjxm,sjjgrq,tsnr,bz,clqk,clzt,clr,clsj,gysmc,dwmc,tsxlmc";
	ls_sql+=" from (";

	ls_sql+=" SELECT '09' yzcdbm,'�������' yzcdmc,crm_tsjl.lx,khxm||'('||lxfs||')' khxm,slfsmc,fwdz,sjs,sgdmc sgd,zjxm,NVL2(crm_tsbm.clqk,'��¼�룺'||TO_CHAR(crm_tsbm.lrsj,'YYYY-MM-DD')||'��'||crm_tsbm.lrr||'��'||'������'||TO_CHAR(crm_tsbm.clsj,'YYYY-MM-DD')||'��'||crm_tsbm.clr||'����'||crm_tsbm.clqk,'') clqk,TO_CHAR(sjjgrq,'YYYY-MM-DD') sjjgrq,'��'||slr||'��'||TO_CHAR(slsj,'YYYY-MM-DD HH:MM:SS')||'����'||tsnr tsnr,crm_tsjl.bz,DECODE(crm_tsbm.clzt,'0','δ֪ͨ','1','��֪ͨδ����','2','�ڴ���','3','�ѽ��') clzt,crm_tsbm.clr clr,crm_tsbm.clsj clsj,gysmc,b.dwmc,tsxlmc";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,sq_sgd,dm_yzcdbm,crm_tsbm,dm_tsxlbm,sq_dwxx b,sq_gysxx,crm_tspp  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) ";
    ls_sql+=" and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) and crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp=sq_gysxx.gysbh(+) ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_tsjl.sftsqk='Y'";//Y���ǣ�N����
    ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.dwbh=b.dwbh(+)";
	ls_sql+=" and crm_tsbm.tslxbm in('12','23')";//23���Ҿ�Ͷ�� 12���Ҿӱ���
	ls_sql+=wheresql;

	ls_sql+=" union";

	ls_sql+=" SELECT crm_tsjl.yzcdbm,yzcdmc,crm_tsjl.lx,khxm||'('||lxfs||')' khxm,slfsmc,fwdz,sjs,sgdmc sgd,zjxm,NVL2(crm_tsbm.clqk,'��¼�룺'||TO_CHAR(crm_tsbm.lrsj,'YYYY-MM-DD')||'��'||crm_tsbm.lrr||'��'||'������'||TO_CHAR(crm_tsbm.clsj,'YYYY-MM-DD')||'��'||crm_tsbm.clr||'����'||crm_tsbm.clqk,'') clqk,TO_CHAR(sjjgrq,'YYYY-MM-DD') sjjgrq,'��'||slr||'��'||TO_CHAR(slsj,'YYYY-MM-DD HH:MM:SS')||'����'||tsnr tsnr,crm_tsjl.bz,DECODE(crm_tsbm.clzt,'0','δ֪ͨ','1','��֪ͨδ����','2','�ڴ���','3','�ѽ��') clzt,crm_tsbm.clr clr,crm_tsbm.clsj clsj,gysmc,b.dwmc,tsxlmc";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,sq_sgd,dm_yzcdbm,crm_tsbm,dm_tsxlbm,sq_dwxx b,sq_gysxx,crm_tspp  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) ";
    ls_sql+=" and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) and crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp=sq_gysxx.gysbh(+) ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_tsjl.lx='1'";
    ls_sql+=" and crm_tsjl.sftsqk='N'";//Y���ǣ�N����
    ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.dwbh=b.dwbh(+)";
	ls_sql+=" and crm_tsbm.tslxbm in('12','23')";//23���Ҿ�Ͷ�� 12���Ҿӱ���
	ls_sql+=wheresql;

	ls_sql+=" union";

	ls_sql+=" SELECT '00' yzcdbm,'����' yzcdmc,crm_tsjl.lx,khxm||'('||lxfs||')' khxm,slfsmc,fwdz,sjs,sgdmc sgd,zjxm,NVL2(crm_tsbm.clqk,'��¼�룺'||TO_CHAR(crm_tsbm.lrsj,'YYYY-MM-DD')||'��'||crm_tsbm.lrr||'��'||'������'||TO_CHAR(crm_tsbm.clsj,'YYYY-MM-DD')||'��'||crm_tsbm.clr||'����'||crm_tsbm.clqk,'') clqk,TO_CHAR(sjjgrq,'YYYY-MM-DD') sjjgrq,'��'||slr||'��'||TO_CHAR(slsj,'YYYY-MM-DD HH:MM:SS')||'����'||tsnr tsnr,crm_tsjl.bz,DECODE(crm_tsbm.clzt,'0','δ֪ͨ','1','��֪ͨδ����','2','�ڴ���','3','�ѽ��') clzt,crm_tsbm.clr clr,crm_tsbm.clsj clsj,gysmc,b.dwmc,tsxlmc";
	ls_sql+=" FROM crm_tsjl,crm_khxx,dm_slfsbm,sq_sgd,dm_yzcdbm,crm_tsbm,dm_tsxlbm,sq_dwxx b,sq_gysxx,crm_tspp  ";
    ls_sql+=" where crm_tsjl.khbh=crm_khxx.khbh and crm_tsjl.slfsbm=dm_slfsbm.slfsbm(+) ";
    ls_sql+=" and crm_tsjl.yzcdbm=dm_yzcdbm.yzcdbm(+) and crm_tsjl.tsjlh=crm_tspp.tsjlh and crm_tspp.tspp=sq_gysxx.gysbh(+) ";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+) ";
    ls_sql+=" and crm_tsjl.lx='2'";
    ls_sql+=" and crm_tsjl.sftsqk='N'";//Y���ǣ�N����
    ls_sql+=" and crm_tsjl.tsjlh=crm_tsbm.tsjlh(+) and crm_tsbm.tsxlbm=dm_tsxlbm.tsxlbm(+) and crm_tsbm.dwbh=b.dwbh(+)";
	ls_sql+=" and crm_tsbm.tslxbm in('12','23')";//23���Ҿ�Ͷ�� 12���Ҿӱ���
	ls_sql+=wheresql;
    ls_sql+=" order by yzcdbm desc";

	ls_sql+=" )";
	
	//out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");
	pageObj.alignStr[4]="align='left'";
	pageObj.alignStr[9]="align='left'";
	pageObj.alignStr[10]="align='left'";
	pageObj.alignStr[11]="align='left'";

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash=new Hashtable();
	spanColHash.put("yzcdmc","1");//�в����������Hash��
	spanColHash.put("khxm","1");//�в����������Hash��
	spanColHash.put("slfsmc","1");//�в����������Hash��
	spanColHash.put("fwdz","1");//�в����������Hash��
	spanColHash.put("sjs","1");//�в����������Hash��
	spanColHash.put("sgd","1");//�в����������Hash��
	spanColHash.put("zjxm","1");//�в����������Hash��
	spanColHash.put("sjjgrq","1");//�в����������Hash��
	spanColHash.put("tsnr","1");//�в����������Hash��
	spanColHash.put("bz","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);


	pageObj.displayDate();
	pageObj.displayFoot();
%> 
</table>

</body>
</html>