<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

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

	String gyslb=null;
	gyslb=request.getParameter("gyslb");
	if (gyslb!=null)
	{
		gyslb=cf.GB2Uni(gyslb);
		if (!(gyslb.equals("")))	wheresql+=" and  (sq_dwxx.gyslb='"+gyslb+"')";
	}
	String zclb=null;
	zclb=request.getParameter("zclb");
	if (zclb!=null)
	{
		zclb=cf.GB2Uni(zclb);
		if (!(zclb.equals("")))	wheresql+=" and  (sq_dwxx.zclb='"+zclb+"')";
	}
	String xmzy=null;
	xmzy=request.getParameter("xmzy");
	if (xmzy!=null)
	{
		xmzy=cf.GB2Uni(xmzy);
		if (!(xmzy.equals("")))	wheresql+=" and  (sq_dwxx.xmzy='"+xmzy+"')";
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
	
	String sq_sgcqxx_cqbm=null;
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

	ls_sql="SELECT (select dwmc from sq_dwxx a where a.dwbh=sq_dwxx.ssdw) ssdwmc";
	ls_sql+=" ,DECODE(dwlx,'A0','�ܲ�','A1','�ܲ�����','F0','�ֹ�˾','F1','�ֹ�˾����','F2','����','S0','ʩ����','S1','ֱ��ʩ����','S2','ʩ������','G0','��Ӧ��','J0','������','Y0','�칫��Ʒ��λ') as dwlx";
	ls_sql+=" ,DECODE(gyslb,'1','ľ��','2','����','3','�Ҿ�','4','����') gyslb,zcdlmc,sq_dwxx.dwbh,dwmc,DECODE(sq_dwlxr.sflz,'Y','��','N','') sflz";
	ls_sql+=" ,sq_dwlxr.lxrxm,sq_dwlxr.zw,sq_dwlxr.sj,sq_dwlxr.bgdh,sq_dwlxr.cz,sq_dwlxr.bz";
	ls_sql+=" FROM sq_dwxx,jdm_zcdlbm,sq_dwlxr  ";
    ls_sql+=" where sq_dwxx.zclb=jdm_zcdlbm.zcdlbm(+)";
	ls_sql+=" and sq_dwlxr.dwbh(+)=sq_dwxx.dwbh";
    ls_sql+=wheresql;
    ls_sql+=" order by sq_dwxx.ssfgs,dwlx,gyslb,zclb,dwbh";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_dwxxTxlList.jsp","SelectTxlSq_dwxx.jsp","","");
	pageObj.setPageRow(300);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"dwbh","sq_dwxx_dwmc","sq_dwxx_dwjc","sq_dwxx_ssdw","sq_dwxx_dwlx","sq_dwxx_dwfzr","sq_dwxx_dwdh","dm_fgflbm_fgflmc","dm_ysbm_ysmc","dm_cqbm_cqmc"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"dwbh"};
	pageObj.setKey(keyName);
//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("ssdwmc","1");//�в����������Hash��
	spanColHash.put("dwlx","1");//�в����������Hash��
	spanColHash.put("gyslb","1");//�в����������Hash��
	spanColHash.put("zcdlmc","1");//�в����������Hash��
	spanColHash.put("dwbh","1");//�в����������Hash��
	spanColHash.put("dwmc","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

/*
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"dwbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="EditSq_dwxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("dwbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">ͨѶ¼��ѯ</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(120);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="7%">�ϼ���λ</td>
	<td  width="5%">��λ����</td>
	<td  width="5%">��Ӧ�����</td>
	<td  width="5%">�������</td>
	<td  width="6%">��λ���</td>
	<td  width="12%">��λ����</td>
	<td  width="4%">�Ƿ���ְ</td>
	<td  width="6%">��ϵ������</td>
	<td  width="7%">ְ��</td>
	<td  width="10%">�ֻ�</td>
	<td  width="10%">�칫�绰</td>
	<td  width="10%">����</td>
	<td  width="13%">��ע</td>
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