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
	String sq_gysxx_gysbh=null;
	String sq_gysxx_gysmc=null;
	String sq_gysxx_dqbm=null;
	String sq_gysxx_gyslb=null;
	String sq_gysxx_zclb=null;

	String sfyyh=null;
	sfyyh=request.getParameter("sfyyh");
	if (sfyyh!=null)
	{
		sfyyh=cf.GB2Uni(sfyyh);
		if (!(sfyyh.equals("")))	wheresql+=" and  (sq_gysxx.sfyyh='"+sfyyh+"')";
	}


	String ppbm=null;
	ppbm=request.getParameter("ppbm");
	if (ppbm!=null)
	{
		ppbm=cf.GB2Uni(ppbm);
		if (!(ppbm.equals("")))	wheresql+=" and  (sq_gysxx.ppbm='"+ppbm+"')";
	}
	String ppmc=null;
	ppmc=request.getParameter("ppmc");
	if (ppmc!=null)
	{
		ppmc=cf.GB2Uni(ppmc);
		if (!(ppmc.equals("")))	wheresql+=" and  (sq_gysxx.ppmc='"+ppmc+"')";
	}
	String ppmc2=null;
	ppmc2=request.getParameter("ppmc2");
	if (ppmc2!=null)
	{
		ppmc2=cf.GB2Uni(ppmc2);
		if (!(ppmc2.equals("")))	wheresql+=" and  (sq_gysxx.ppmc like '%"+ppmc2+"%')";
	}

	String gysbm=null;
	gysbm=request.getParameter("gysbm");
	if (gysbm!=null)
	{
		gysbm=cf.GB2Uni(gysbm);
		if (!(gysbm.equals("")))	wheresql+=" and  (sq_gysxx.gysbm='"+gysbm+"')";
	}
	String gys=null;
	gys=request.getParameter("gys");
	if (gys!=null)
	{
		gys=cf.GB2Uni(gys);
		if (!(gys.equals("")))	wheresql+=" and  (sq_gysxx.gys='"+gys+"')";
	}
	String gys2=null;
	gys2=request.getParameter("gys2");
	if (gys2!=null)
	{
		gys2=cf.GB2Uni(gys2);
		if (!(gys2.equals("")))	wheresql+=" and  (sq_gysxx.gys like '%"+gys2+"%')";
	}

	
	sq_gysxx_gysbh=request.getParameter("sq_gysxx_gysbh");
	if (sq_gysxx_gysbh!=null)
	{
		sq_gysxx_gysbh=cf.GB2Uni(sq_gysxx_gysbh);
		if (!(sq_gysxx_gysbh.equals("")))	wheresql+=" and  (sq_gysxx.gysbh='"+sq_gysxx_gysbh+"')";
	}
	sq_gysxx_gysmc=request.getParameter("sq_gysxx_gysmc");
	if (sq_gysxx_gysmc!=null)
	{
		sq_gysxx_gysmc=cf.GB2Uni(sq_gysxx_gysmc);
		if (!(sq_gysxx_gysmc.equals("")))	wheresql+=" and  (sq_gysxx.gysmc like '%"+sq_gysxx_gysmc+"%')";
	}
	sq_gysxx_dqbm=request.getParameter("sq_gysxx_dqbm");
	if (sq_gysxx_dqbm!=null)
	{
		sq_gysxx_dqbm=cf.GB2Uni(sq_gysxx_dqbm);
		if (!(sq_gysxx_dqbm.equals("")))	wheresql+=" and  (sq_gysxx.dqbm='"+sq_gysxx_dqbm+"')";
	}
	sq_gysxx_gyslb=request.getParameter("sq_gysxx_gyslb");
	if (sq_gysxx_gyslb!=null)
	{
		sq_gysxx_gyslb=cf.GB2Uni(sq_gysxx_gyslb);
		if (!(sq_gysxx_gyslb.equals("")))	wheresql+=" and  (sq_gysxx.gyslb='"+sq_gysxx_gyslb+"')";
	}
	sq_gysxx_zclb=request.getParameter("sq_gysxx_zclb");
	if (sq_gysxx_zclb!=null)
	{
		sq_gysxx_zclb=cf.GB2Uni(sq_gysxx_zclb);
		if (!(sq_gysxx_zclb.equals("")))	wheresql+=" and  (sq_gysxx.zclb='"+sq_gysxx_zclb+"')";
	}

	String px=request.getParameter("px");
	
	ls_sql="SELECT  sq_gysxx.gysbh,sq_gysxx.gysmc,sq_gysxx.cwdm,mrazhs,DECODE(sq_gysxx.gyslb,'1','ľ��','2','����','3','�Ҿ�','4','����') gyslb,zclb,DECODE(sq_gysxx.sfyyh,'Y','��','N','��') sfyyh,sq_gysxx.yhkssj,sq_gysxx.yhjzsj,sq_gysxx.yhnr,sq_gysxx.ppbm,sq_gysxx.ppmc,sq_gysxx.gysbm,sq_gysxx.gys,dm_dqbm.dqmc, sq_gysxx.bz  ";
	ls_sql+=" FROM dm_dqbm,sq_gysxx  ";
    ls_sql+=" where sq_gysxx.dqbm=dm_dqbm.dqbm ";
    ls_sql+=wheresql;
	if (px.equals(""))
	{
		ls_sql+=" order by sq_gysxx.dqbm,sq_gysxx.gyslb,sq_gysxx.zclb,sq_gysxx.gysmc";
	}
	else{
		ls_sql+=" order by "+px;
	}
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_gysxxCxList.jsp","SelectCxSq_gysxx.jsp","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��


//��������
	String[] keyName={"gysbm"};
	pageObj.setKey(keyName);

//������ʾ�ϲ���
	Hashtable spanColHash=new Hashtable();
	spanColHash.put("zclb","1");//�в����������Hash��
	pageObj.setSpanCol(spanColHash);//�в����������Hash��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"gysbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/xtsq/gys/ViewSq_gysbm.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("gysbm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"gysbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/xtsq/ppgys/ViewSq_gysxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("gysbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

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
  <B><font size="3">��ѯ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(230);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">Ʒ�ƹ�Ӧ�̱��</td>
	<td  width="10%">Ʒ�ƹ�Ӧ������</td>
	<td  width="3%">�������</td>
	<td  width="3%">ÿ�հ�װ��������</td>
	<td  width="3%">��Ӧ�����</td>
	<td  width="9%">�������</td>
	<td  width="3%">�Ƿ����Ż�</td>
	<td  width="4%">�Żݿ�ʼʱ��</td>
	<td  width="4%">�Żݽ���ʱ��</td>
	<td  width="17%">�Ż�����</td>
	<td  width="3%">Ʒ�Ʊ���</td>
	<td  width="9%">Ʒ������</td>
	<td  width="3%">��Ӧ�̱���</td>
	<td  width="12%">��Ӧ������</td>
	<td  width="3%">��������</td>
	<td  width="11%">��ע</td>
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