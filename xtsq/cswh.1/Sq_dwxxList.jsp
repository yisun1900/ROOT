<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>

<%
if (cf.check((String)session.getAttribute("yhdlm"),request.getRemoteHost(),"010102")==0) 
{
	out.print(new String("ϵͳ����ʱ������������µ�¼��"));
	return;
}
%>

<%
int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String sq_dwxx_dwbh=null;
	String sq_dwxx_dwmc=null;
	String sq_dwxx_dwjc=null;
	String sq_dwxx_ssdw=null;
	String sq_dwxx_dwlx=null;
	String sq_dwxx_dwdz=null;
	String sq_dwxx_dwfzr=null;
	String sq_dwxx_dwdh=null;
	String sq_dwxx_dwcz=null;
	String sq_dwxx_email=null;
	String sq_scfgxx_fgflbm=null;
	String sq_scysxx_ysbm=null;
	String sq_sgcqxx_cqbm=null;


	String jcddblxs=null;
	jcddblxs=request.getParameter("jcddblxs");
	if (jcddblxs!=null)
	{
		jcddblxs=cf.GB2Uni(jcddblxs);
		if (!(jcddblxs.equals("")))	wheresql+=" and  (sq_dwxx.jcddblxs='"+jcddblxs+"')";
	}

	String jcddmxblxs=null;
	jcddmxblxs=request.getParameter("jcddmxblxs");
	if (jcddmxblxs!=null)
	{
		jcddmxblxs=cf.GB2Uni(jcddmxblxs);
		if (!(jcddmxblxs.equals("")))	wheresql+=" and  (sq_dwxx.jcddmxblxs='"+jcddmxblxs+"')";
	}

	String jcppbz=null;
	jcppbz=request.getParameter("jcppbz");
	if (jcppbz!=null)
	{
		jcppbz=cf.GB2Uni(jcppbz);
		if (!(jcppbz.equals("")))	wheresql+=" and  (sq_dwxx.jcppbz='"+jcppbz+"')";
	}
	String zxkhlrjc=null;
	zxkhlrjc=request.getParameter("zxkhlrjc");
	if (zxkhlrjc!=null)
	{
		zxkhlrjc=cf.GB2Uni(zxkhlrjc);
		if (!(zxkhlrjc.equals("")))	wheresql+=" and  (sq_dwxx.zxkhlrjc='"+zxkhlrjc+"')";
	}
	String zxkhlrts=null;
	zxkhlrts=request.getParameter("zxkhlrts");
	if (zxkhlrts!=null)
	{
		zxkhlrts=cf.GB2Uni(zxkhlrts);
		if (!(zxkhlrts.equals("")))	wheresql+=" and  (sq_dwxx.zxkhlrts='"+zxkhlrts+"')";
	}
	String qdkhbljc=null;
	qdkhbljc=request.getParameter("qdkhbljc");
	if (qdkhbljc!=null)
	{
		qdkhbljc=cf.GB2Uni(qdkhbljc);
		if (!(qdkhbljc.equals("")))	wheresql+=" and  (sq_dwxx.qdkhbljc='"+qdkhbljc+"')";
	}
	String qdkhblts=null;
	qdkhblts=request.getParameter("qdkhblts");
	if (qdkhblts!=null)
	{
		qdkhblts=cf.GB2Uni(qdkhblts);
		if (!(qdkhblts.equals("")))	wheresql+=" and  (sq_dwxx.qdkhblts='"+qdkhblts+"')";
	}
	String dzbjjc=null;
	dzbjjc=request.getParameter("dzbjjc");
	if (dzbjjc!=null)
	{
		dzbjjc=cf.GB2Uni(dzbjjc);
		if (!(dzbjjc.equals("")))	wheresql+=" and  (sq_dwxx.dzbjjc='"+dzbjjc+"')";
	}
	String hfsjzdsz=null;
	hfsjzdsz=request.getParameter("hfsjzdsz");
	if (hfsjzdsz!=null)
	{
		hfsjzdsz=cf.GB2Uni(hfsjzdsz);
		if (!(hfsjzdsz.equals("")))	wheresql+=" and  (sq_dwxx.hfsjzdsz='"+hfsjzdsz+"')";
	}
	String xmzyglbz=null;
	xmzyglbz=request.getParameter("xmzyglbz");
	if (xmzyglbz!=null)
	{
		xmzyglbz=cf.GB2Uni(xmzyglbz);
		if (!(xmzyglbz.equals("")))	wheresql+=" and  (sq_dwxx.xmzyglbz='"+xmzyglbz+"')";
	}
	String jjgwglbz=null;
	jjgwglbz=request.getParameter("jjgwglbz");
	if (jjgwglbz!=null)
	{
		jjgwglbz=cf.GB2Uni(jjgwglbz);
		if (!(jjgwglbz.equals("")))	wheresql+=" and  (sq_dwxx.jjgwglbz='"+jjgwglbz+"')";
	}

	String dmxs=null;
	dmxs=request.getParameter("dmxs");
	if (dmxs!=null)
	{
		dmxs=cf.GB2Uni(dmxs);
		if (!(dmxs.equals("")))	wheresql+=" and  (sq_dwxx.dmxs='"+dmxs+"')";
	}

	String ssfw=null;
	ssfw=request.getParameter("ssfw");
	if (ssfw!=null)
	{
		ssfw=cf.GB2Uni(ssfw);
		if (!(ssfw.equals("")))	wheresql+=" and  (sq_dwxx.ssfw='"+ssfw+"')";
	}
	String dwjb=null;
	dwjb=request.getParameter("dwjb");
	if (dwjb!=null)
	{
		dwjb=cf.GB2Uni(dwjb);
		if (!(dwjb.equals("")))	wheresql+=" and  (sq_dwxx.dwjb='"+dwjb+"')";
	}

	String dwflbm=null;
	dwflbm=request.getParameter("dwflbm");
	if (dwflbm!=null)
	{
		dwflbm=cf.GB2Uni(dwflbm);
		if (!(dwflbm.equals("")))	wheresql+=" and  (sq_dwxx.dwflbm='"+dwflbm+"')";
	}
	String ssdqbm=null;
	ssdqbm=request.getParameter("ssdqbm");
	if (ssdqbm!=null)
	{
		ssdqbm=cf.GB2Uni(ssdqbm);
		if (!(ssdqbm.equals("")))	wheresql+=" and  (sq_dwxx.ssdqbm='"+ssdqbm+"')";
	}


	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (sq_xmzy.xmzy='"+xmzy+"')";
	}
	String ssfgs=null;
	ssfgs=request.getParameter("ssfgs");
	if (ssfgs!=null)
	{
		if (!(ssfgs.equals("")))	wheresql+=" and  (sq_dwxx.ssfgs='"+ssfgs+"')";
	}

	String hthqz=null;
	hthqz=request.getParameter("hthqz");
	if (hthqz!=null)
	{
		if (!(hthqz.equals("")))	wheresql+=" and  (sq_dwxx.hthqz='"+hthqz+"')";
	}
	String cxbz=null;
	cxbz=request.getParameter("cxbz");
	if (cxbz!=null)
	{
		if (!(cxbz.equals("")))	wheresql+=" and  (sq_dwxx.cxbz='"+cxbz+"')";
	}

	String sfjms=null;
	sfjms=request.getParameter("sfjms");
	if (sfjms!=null)
	{
		if (!(sfjms.equals("")))	wheresql+=" and  (sq_dwxx.sfjms='"+sfjms+"')";
	}
	
	sq_dwxx_dwbh=request.getParameter("sq_dwxx_dwbh");
	if (sq_dwxx_dwbh!=null)
	{
		sq_dwxx_dwbh=cf.GB2Uni(sq_dwxx_dwbh);
		if (!(sq_dwxx_dwbh.equals("")))	wheresql+=" and  (sq_dwxx.dwbh='"+sq_dwxx_dwbh+"')";
	}
	String sq_dwxx_dqbm=null;
	sq_dwxx_dqbm=request.getParameter("sq_dwxx_dqbm");
	if (sq_dwxx_dqbm!=null)
	{
		if (!(sq_dwxx_dqbm.equals("")))	wheresql+=" and  (sq_dwxx.dqbm='"+sq_dwxx_dqbm+"')";
	}
	sq_dwxx_dwmc=request.getParameter("sq_dwxx_dwmc");
	if (sq_dwxx_dwmc!=null)
	{
		sq_dwxx_dwmc=cf.GB2Uni(sq_dwxx_dwmc);
		if (!(sq_dwxx_dwmc.equals("")))	wheresql+=" and  (sq_dwxx.dwmc like '%"+sq_dwxx_dwmc+"%')";
	}
	sq_dwxx_dwjc=request.getParameter("sq_dwxx_dwjc");
	if (sq_dwxx_dwjc!=null)
	{
		sq_dwxx_dwjc=cf.GB2Uni(sq_dwxx_dwjc);
		if (!(sq_dwxx_dwjc.equals("")))	wheresql+=" and  (sq_dwxx.dwjc='"+sq_dwxx_dwjc+"')";
	}
	sq_dwxx_ssdw=request.getParameter("sq_dwxx_ssdw");
	if (sq_dwxx_ssdw!=null)
	{
		sq_dwxx_ssdw=cf.GB2Uni(sq_dwxx_ssdw);
		if (!(sq_dwxx_ssdw.equals("")))	wheresql+=" and  (sq_dwxx.ssdw='"+sq_dwxx_ssdw+"')";
	}
	sq_dwxx_dwlx=request.getParameter("sq_dwxx_dwlx");
	if (sq_dwxx_dwlx!=null)
	{
		sq_dwxx_dwlx=cf.GB2Uni(sq_dwxx_dwlx);
		if (!(sq_dwxx_dwlx.equals("")))	wheresql+=" and  (sq_dwxx.dwlx='"+sq_dwxx_dwlx+"')";
	}
	sq_dwxx_dwdz=request.getParameter("sq_dwxx_dwdz");
	if (sq_dwxx_dwdz!=null)
	{
		sq_dwxx_dwdz=cf.GB2Uni(sq_dwxx_dwdz);
		if (!(sq_dwxx_dwdz.equals("")))	wheresql+=" and  (sq_dwxx.dwdz='"+sq_dwxx_dwdz+"')";
	}
	sq_dwxx_dwfzr=request.getParameter("sq_dwxx_dwfzr");
	if (sq_dwxx_dwfzr!=null)
	{
		sq_dwxx_dwfzr=cf.GB2Uni(sq_dwxx_dwfzr);
		if (!(sq_dwxx_dwfzr.equals("")))	wheresql+=" and  (sq_dwxx.dwfzr='"+sq_dwxx_dwfzr+"')";
	}
	sq_dwxx_dwdh=request.getParameter("sq_dwxx_dwdh");
	if (sq_dwxx_dwdh!=null)
	{
		sq_dwxx_dwdh=cf.GB2Uni(sq_dwxx_dwdh);
		if (!(sq_dwxx_dwdh.equals("")))	wheresql+=" and  (sq_dwxx.dwdh='"+sq_dwxx_dwdh+"')";
	}
	sq_dwxx_dwcz=request.getParameter("sq_dwxx_dwcz");
	if (sq_dwxx_dwcz!=null)
	{
		sq_dwxx_dwcz=cf.GB2Uni(sq_dwxx_dwcz);
		if (!(sq_dwxx_dwcz.equals("")))	wheresql+=" and  (sq_dwxx.dwcz='"+sq_dwxx_dwcz+"')";
	}
	sq_dwxx_email=request.getParameter("sq_dwxx_email");
	if (sq_dwxx_email!=null)
	{
		sq_dwxx_email=cf.GB2Uni(sq_dwxx_email);
		if (!(sq_dwxx_email.equals("")))	wheresql+=" and  (sq_dwxx.email='"+sq_dwxx_email+"')";
	}


	String jgpx1=cf.GB2Uni(request.getParameter("jgpx1"));

	ls_sql="SELECT ssdqmc,dqmc,(select dwmc from sq_dwxx b where b.dwbh=sq_dwxx.ssfgs) ssfgs,(select dwmc from sq_dwxx a where a.dwbh=sq_dwxx.ssdw) ssdwmc,DECODE(dwlx,'A0','�ܲ�','A1','�ܲ�����','F0','�ֹ�˾','F1','�ֹ�˾����','F2','����','F3','���С��','F4','�г�С��','F5','����С��') as dwlx,dwflmc,sq_dwxx.xuhao,sq_dwxx.dwbh,dwmc,jryjbfb||'%',sq_dwxx.bianma,sq_dwxx.cwdm,sq_dwxx.hthqz,DECODE(sfjms,'Y','����','N','ֱӪ��˾','Q','������˾'),DECODE(jcppbz,'Y','ȡ����','N','ȡ�����ֵ�'),DECODE(zcmmbz,'Y','ȡ����','N','ȡ�����ֵ�','M','�ɿ�'),DECODE(cgjjbz,'Y','ȡ����','N','ȡ�����ֵ�','M','�ɿ�'),DECODE(zxkhlrjc,'Y','����','N','������'),zxkhlrts,DECODE(qdkhbljc,'Y','����','N','������'),qdkhblts,DECODE(dzbjjc,'1','����[�ۿ���]��[ǩԼ��]','2','����[ǩԼ��]��[�ۿ���]','3','ȫ���˹�¼��','6','�˹�¼��,�������','4','ǩԼ��ۿ��Զ�ȡ','7','ǩԼ��ۿ��Զ�,�����Żݿɸ�','5','ǩԼ���Զ�ȡ��¼���ۿ�'),DECODE(jcddblxs,2,'2λС��',1,'1λС��',0,'������λ',-1,'����ʮλ',-2,'������λ',-3,'����ǧλ'),hfsjzdsz,DECODE(sq_dwxx.xmzyglbz,'Y','����','N','������'),DECODE(sq_dwxx.jjgwglbz,'Y','����','N','������'),ssfwmc,dwjbmc,DECODE(sq_dwxx.cxbz,'Y','����','N',''),dwdh,dwcz,sq_dwxx.kdsj,sq_dwxx.gdsj,sq_dwxx.bz";
	ls_sql+=" FROM sq_dwxx,dm_dqbm,sq_ssdqbm,dm_dwflbm,dm_ssfw,dm_dwjb,dm_dmxs  ";
    ls_sql+=" where sq_dwxx.dqbm=dm_dqbm.dqbm(+) and sq_dwxx.ssdqbm=sq_ssdqbm.ssdqbm(+) and sq_dwxx.dwflbm=dm_dwflbm.dwflbm(+)";
    ls_sql+=" and sq_dwxx.ssfw=dm_ssfw.ssfw(+) and sq_dwxx.dwjb=dm_dwjb.dwjb(+) and sq_dwxx.dmxs=dm_dmxs.dmxs(+)";
    ls_sql+=wheresql;
	if (!jgpx1.equals(""))
	{
		ls_sql+=" order by "+jgpx1;
	}
	else{
		ls_sql+=" order by sq_dwxx.dqbm,sq_dwxx.ssfgs,sq_dwxx.cxbz,sq_dwxx.ssdw,sq_dwxx.dwlx,dwbh";
	}
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_dwxxList.jsp","","","EditSq_dwxx.jsp");
	pageObj.setPageRow(100);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dwbh","dwmc","dwfzr","dwdh","dwcz","email"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dwbh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��ѡ�е���Ϣ"};//��ť����ʾ����
	String[] buttonLink={"Sq_dwxxList.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={0};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"dwbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewSq_dwxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("dwbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("ssdqmc","1");//�в����������Hash��
	spanColHash.put("dqmc","1");//�в����������Hash��
	spanColHash.put("ssfgs","1");//�в����������Hash��
	spanColHash.put("ssdwmc","1");//�в����������Hash��
	spanColHash.put("dwlx","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	String[] dwbh = request.getParameterValues("dwbh");
	String chooseitem =cf.GB2Uni(cf.arrayToInSQL(dwbh,"dwbh"));
	if (pageObj.needDelete(chooseitem))//�ж��Ƿ���Ҫִ��ɾ������
	{
		String[] sql=new String[1];//Ҫִ�е�SQL
		boolean needCommit=false;//����Ҫ������
		sql[0]="delete from sq_dwxx where dwbh!='99999' and "+chooseitem;
		pageObj.execDelete(sql,needCommit);
	}
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��λ��Ϣ��ά��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(400);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">��������</td>
	<td  width="2%">��������</td>
	<td  width="3%">�����ֹ�˾</td>
	<td  width="4%">�ϼ���λ</td>
	<td  width="3%">��λ����</td>
	<td  width="3%">��λ����</td>
	<td  width="1%">���</td>
	<td  width="2%">��λ���</td>
	<td  width="4%">��λ����</td>
	<td  width="2%">����ҵ���տ����</td>
	<td  width="2%">����</td>
	<td  width="2%">�������</td>
	<td  width="3%">��ͬ��ǰ׺</td>
	<td  width="2%">��˾����</td>
	<td  width="2%">Ͷ�߱��޹�Ӧ�̼��</td>
	<td  width="2%">�����տ���</td>
	<td  width="2%">�����տ���</td>
	<td  width="2%">������ѯ�ͻ�¼����</td>
	<td  width="2%">��ѯ�ͻ���ǰ¼������</td>
	<td  width="2%">����ǩ���ͻ���¼���</td>
	<td  width="2%">ǩ���ͻ���¼��������</td>
	<td  width="5%">���õ��ӱ��ۼ��</td>
	<td  width="2%">���ɶ�������С��</td>
	<td  width="2%">���ûط�ʱ���Զ�����</td>
	<td  width="2%">���ɶ�������ĿרԱ����</td>
	<td  width="2%">���ɶ����ԼҾӹ��ʹ���</td>
	<td  width="3%">������λ</td>
	<td  width="3%">��λ����</td>
	<td  width="2%">������־</td>
	<td  width="9%">�绰</td>
	<td  width="6%">����</td>
	<td  width="3%">����ʱ��</td>
	<td  width="3%">�ص�ʱ��</td>
	<td  width="7%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>