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
	String sq_gysbm_gysbm=null;
	String sq_gysbm_gys=null;
	String sq_gysbm_dqbm=null;
	String sq_gysbm_gysdz=null;
	String sq_gysbm_gysfzr=null;
	String sq_gysbm_gysdh=null;
	String sq_gysbm_gyscz=null;
	String sq_gysbm_email=null;

	String sq_gysxx_gyslb=null;
	String sq_gysxx_zclb=null;

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

	String sfsq=null;
	sfsq=request.getParameter("sfsq");
	if (sfsq!=null)
	{
		if (sfsq.equals("Y"))
		{
			wheresql+=" and  (sq_gysbm.yhdlm in(select yhdlm from sq_yhssz))";
		}
		else if (sfsq.equals("N"))
		{
			wheresql+=" and  (sq_gysbm.yhdlm not in(select yhdlm from sq_yhssz) or sq_gysbm.yhdlm is null)";
		}
	}

	String yhdlm=null;
	yhdlm=request.getParameter("yhdlm");
	if (yhdlm!=null)
	{
		yhdlm=cf.GB2Uni(yhdlm);
		if (!(yhdlm.equals("")))	wheresql+=" and  (sq_gysbm.yhdlm='"+yhdlm+"')";
	}

	String yhkl=null;
	yhkl=request.getParameter("yhkl");
	if (yhkl!=null)
	{
		yhkl=cf.GB2Uni(yhkl);
		if (!(yhkl.equals("")))	wheresql+=" and  (sq_gysbm.yhkl='"+yhkl+"')";
	}

	String yhmc=null;
	yhmc=request.getParameter("yhmc");
	if (yhmc!=null)
	{
		yhmc=cf.GB2Uni(yhmc);
		if (!(yhmc.equals("")))	wheresql+=" and  (sq_gysbm.yhmc like '%"+yhmc+"%')";
	}


	sq_gysbm_gysbm=request.getParameter("sq_gysbm_gysbm");
	if (sq_gysbm_gysbm!=null)
	{
		sq_gysbm_gysbm=cf.GB2Uni(sq_gysbm_gysbm);
		if (!(sq_gysbm_gysbm.equals("")))	wheresql+=" and  (sq_gysbm.gysbm='"+sq_gysbm_gysbm+"')";
	}
	sq_gysbm_gys=request.getParameter("sq_gysbm_gys");
	if (sq_gysbm_gys!=null)
	{
		sq_gysbm_gys=cf.GB2Uni(sq_gysbm_gys);
		if (!(sq_gysbm_gys.equals("")))	wheresql+=" and  (sq_gysbm.gys like '%"+sq_gysbm_gys+"%')";
	}
	sq_gysbm_dqbm=request.getParameter("sq_gysbm_dqbm");
	if (sq_gysbm_dqbm!=null)
	{
		sq_gysbm_dqbm=cf.GB2Uni(sq_gysbm_dqbm);
		if (!(sq_gysbm_dqbm.equals("")))	wheresql+=" and  (sq_gysbm.dqbm='"+sq_gysbm_dqbm+"')";
	}
	sq_gysbm_gysdz=request.getParameter("sq_gysbm_gysdz");
	if (sq_gysbm_gysdz!=null)
	{
		sq_gysbm_gysdz=cf.GB2Uni(sq_gysbm_gysdz);
		if (!(sq_gysbm_gysdz.equals("")))	wheresql+=" and  (sq_gysbm.gysdz='"+sq_gysbm_gysdz+"')";
	}
	sq_gysbm_gysfzr=request.getParameter("sq_gysbm_gysfzr");
	if (sq_gysbm_gysfzr!=null)
	{
		sq_gysbm_gysfzr=cf.GB2Uni(sq_gysbm_gysfzr);
		if (!(sq_gysbm_gysfzr.equals("")))	wheresql+=" and  (sq_gysbm.gysfzr='"+sq_gysbm_gysfzr+"')";
	}
	sq_gysbm_gysdh=request.getParameter("sq_gysbm_gysdh");
	if (sq_gysbm_gysdh!=null)
	{
		sq_gysbm_gysdh=cf.GB2Uni(sq_gysbm_gysdh);
		if (!(sq_gysbm_gysdh.equals("")))	wheresql+=" and  (sq_gysbm.gysdh='"+sq_gysbm_gysdh+"')";
	}
	sq_gysbm_gyscz=request.getParameter("sq_gysbm_gyscz");
	if (sq_gysbm_gyscz!=null)
	{
		sq_gysbm_gyscz=cf.GB2Uni(sq_gysbm_gyscz);
		if (!(sq_gysbm_gyscz.equals("")))	wheresql+=" and  (sq_gysbm.gyscz='"+sq_gysbm_gyscz+"')";
	}
	sq_gysbm_email=request.getParameter("sq_gysbm_email");
	if (sq_gysbm_email!=null)
	{
		sq_gysbm_email=cf.GB2Uni(sq_gysbm_email);
		if (!(sq_gysbm_email.equals("")))	wheresql+=" and  (sq_gysbm.email='"+sq_gysbm_email+"')";
	}

	String px=request.getParameter("px");
	
	ls_sql="SELECT distinct sq_gysbm.dqbm,sq_gysbm.gysbm,sq_gysbm.gys,sq_gysbm.yhdlm,sq_gysbm.yhkl,sq_gysbm.yhmc,sq_gysbm.cwdm,sq_gysbm.gysdh,sq_gysbm.gyscz, sq_gysbm.gysdz,sq_gysbm.gysfzr,sq_gysbm.email, sq_gysbm.bz,dm_dqbm.dqmc  ";
	ls_sql+=" FROM dm_dqbm,sq_gysbm,sq_gysxx  ";
    ls_sql+=" where sq_gysbm.dqbm=dm_dqbm.dqbm ";
    ls_sql+=" and sq_gysbm.gysbm=sq_gysxx.gysbm(+) ";
    ls_sql+=wheresql;
	if (px.equals(""))
	{
		ls_sql+=" order by sq_gysbm.dqbm,sq_gysbm.gys";
	}
	else{
		ls_sql+=" order by "+px;
	}
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Sq_gysbmCxList.jsp","SelectCxSq_gysbm.jsp","","");
	pageObj.setPageRow(10000);//����ÿҳ��ʾ��¼��

//������ʾ��
	String[] disColName={"gysbm","gys","dqmc","yhdlm","yhkl","yhmc","cwdm","gysdh","gyscz","gysdz","gysfzr","email","bz"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"gysbm"};
	pageObj.setKey(keyName);


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"gysbm"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewSq_gysbm.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("gysbm",coluParm);//�в����������Hash��
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
  <B><font size="3">��ѯ��Ӧ��</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(210);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">��Ӧ�̱��</td>
	<td  width="16%">��Ӧ������</td>
	<td  width="4%">��������</td>
	<td  width="5%">�û���¼��</td>
	<td  width="5%">�û�����</td>
	<td  width="9%">�û�����</td>
	<td  width="4%">�������</td>
	<td  width="10%">��Ӧ�̵绰</td>
	<td  width="7%">��Ӧ�̴���</td>
	<td  width="9%">��Ӧ�̵�ַ</td>
	<td  width="4%">��Ӧ�̸�����</td>
	<td  width="8%">EMail</td>
	<td  width="14%">��ע</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
</html>