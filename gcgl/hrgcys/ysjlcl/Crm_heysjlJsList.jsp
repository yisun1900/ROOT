<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ
String zwbm=(String)session.getAttribute("zwbm");
String sjsbh=(String)session.getAttribute("sjsbh");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";

	
	if (zwbm.equals("31"))//�������ܣ�ֻ�ܿ���С�鹤��
	{
		wheresql+=" and crm_khxx.zjxm in(select yhmc from sq_yhxx where sjsbh='"+sjsbh+"' and zwbm in('05','31') and sfzszg in('Y','N'))";
	}
	String fgs=null;
	fgs=request.getParameter("fgs");
	if (!(fgs.equals("")))	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";

	String dwbh=null;
	dwbh=request.getParameter("dwbh");
	if (dwbh!=null)
	{
		if (!(dwbh.equals("")))	wheresql+=" and  (crm_khxx.dwbh='"+dwbh+"')";
	}

	String khbh=null;
	khbh=request.getParameter("khbh");
	if (khbh!=null)
	{
		if (!(khbh.equals("")))	wheresql+=" and  (crm_khxx.khbh='"+khbh+"')";
	}
	String hth=null;
	hth=request.getParameter("hth");
	if (hth!=null)
	{
		if (!(hth.equals("")))	wheresql+=" and  (crm_khxx.hth='"+hth+"')";
	}
	String sjs=null;
	sjs=request.getParameter("sjs");
	if (sjs!=null)
	{
		sjs=cf.GB2Uni(sjs);
		if (!(sjs.equals("")))	wheresql+=" and  (crm_khxx.sjs='"+sjs+"')";
	}
	String zjxm=null;
	zjxm=request.getParameter("zjxm");
	if (zjxm!=null)
	{
		zjxm=cf.GB2Uni(zjxm);
		if (!(zjxm.equals("")))	wheresql+=" and  (crm_khxx.zjxm='"+zjxm+"')";
	}
	String sgd=null;
	sgd=request.getParameter("sgd");
	if (sgd!=null)
	{
		sgd=cf.GB2Uni(sgd);
		if (!(sgd.equals("")))	wheresql+=" and  (crm_khxx.sgd='"+sgd+"')";
	}

	String khxm=null;
	khxm=request.getParameter("khxm");
	if (khxm!=null)
	{
		khxm=cf.GB2Uni(khxm);
		if (!(khxm.equals("")))	wheresql+=" and  (crm_khxx.khxm='"+khxm+"')";
	}
	String khxm2=null;
	khxm2=request.getParameter("khxm2");
	if (khxm2!=null)
	{
		khxm2=cf.GB2Uni(khxm2);
		if (!(khxm2.equals("")))	wheresql+=" and  (crm_khxx.khxm like '%"+khxm2+"%')";
	}

	String fwdz=null;
	fwdz=request.getParameter("fwdz");
	if (fwdz!=null)
	{
		fwdz=cf.GB2Uni(fwdz);
		if (!(fwdz.equals("")))	wheresql+=" and  (crm_khxx.fwdz='"+fwdz+"')";
	}
	String fwdz2=null;
	fwdz2=request.getParameter("fwdz2");
	if (fwdz2!=null)
	{
		fwdz2=cf.GB2Uni(fwdz2);
		if (!(fwdz2.equals("")))	wheresql+=" and  (crm_khxx.fwdz like '%"+fwdz2+"%')";
	}

	String lxfs=null;
	lxfs=request.getParameter("lxfs");
	if (lxfs!=null)
	{
		lxfs=cf.GB2Uni(lxfs);
		if (!(lxfs.equals("")))	wheresql+=" and  (crm_khxx.lxfs='"+lxfs+"')";
	}

	String lxfs2=null;
	lxfs2=request.getParameter("lxfs2");
	if (lxfs2!=null)
	{
		lxfs2=cf.GB2Uni(lxfs2);
		if (!(lxfs2.equals("")))	wheresql+=" and  (crm_khxx.lxfs like '%"+lxfs2+"%')";
	}

	
	
	String ysjlh=null;
	String yscsjlh=null;
	String gcysbbh=null;
	String gcysxmbm=null;
	String gcysxmmc=null;
	String yssj=null;
	String ysr=null;
	String sjysjg=null;
	String clbz=null;
	String zgcljlh=null;
	String jhjjsj=null;
	String jsr=null;
	String jssj=null;
	String cljg=null;
	String jjr=null;
	String jjsj=null;
	String zgysjg=null;
	String zgysr=null;
	String zgyssj=null;
	String sfszhf=null;
	String lrr=null;
	String lrsj=null;
	String fdxbz=null;
	String padlrbz=null;
	ysjlh=request.getParameter("ysjlh");
	if (ysjlh!=null)
	{
		ysjlh=cf.GB2Uni(ysjlh);
		if (!(ysjlh.equals("")))	wheresql+=" and  (crm_heysjl.ysjlh='"+ysjlh+"')";
	}
	yscsjlh=request.getParameter("yscsjlh");
	if (yscsjlh!=null)
	{
		yscsjlh=cf.GB2Uni(yscsjlh);
		if (!(yscsjlh.equals("")))	wheresql+=" and  (crm_heysjl.yscsjlh='"+yscsjlh+"')";
	}

	gcysbbh=request.getParameter("gcysbbh");
	if (gcysbbh!=null)
	{
		gcysbbh=cf.GB2Uni(gcysbbh);
		if (!(gcysbbh.equals("")))	wheresql+=" and  (crm_heysjl.gcysbbh='"+gcysbbh+"')";
	}
	gcysxmbm=request.getParameter("gcysxmbm");
	if (gcysxmbm!=null)
	{
		gcysxmbm=cf.GB2Uni(gcysxmbm);
		if (!(gcysxmbm.equals("")))	wheresql+=" and  (crm_heysjl.gcysxmbm='"+gcysxmbm+"')";
	}
	gcysxmmc=request.getParameter("gcysxmmc");
	if (gcysxmmc!=null)
	{
		gcysxmmc=cf.GB2Uni(gcysxmmc);
		if (!(gcysxmmc.equals("")))	wheresql+=" and  (crm_heysjl.gcysxmmc like '%"+gcysxmmc+"%')";
	}
	yssj=request.getParameter("yssj");
	if (yssj!=null)
	{
		yssj=yssj.trim();
		if (!(yssj.equals("")))	wheresql+="  and (crm_heysjl.yssj>=TO_DATE('"+yssj+"','YYYY/MM/DD'))";
	}
	yssj=request.getParameter("yssj2");
	if (yssj!=null)
	{
		yssj=yssj.trim();
		if (!(yssj.equals("")))	wheresql+="  and (crm_heysjl.yssj<=TO_DATE('"+yssj+"','YYYY/MM/DD'))";
	}
	ysr=request.getParameter("ysr");
	if (ysr!=null)
	{
		ysr=cf.GB2Uni(ysr);
		if (!(ysr.equals("")))	wheresql+=" and  (crm_heysjl.ysr='"+ysr+"')";
	}
	sjysjg=request.getParameter("sjysjg");
	if (sjysjg!=null)
	{
		sjysjg=cf.GB2Uni(sjysjg);
		if (!(sjysjg.equals("")))	wheresql+=" and  (crm_heysjl.sjysjg='"+sjysjg+"')";
	}
	clbz=request.getParameter("clbz");
	if (clbz!=null)
	{
		clbz=cf.GB2Uni(clbz);
		if (!(clbz.equals("")))	wheresql+=" and  (crm_heysjl.clbz='"+clbz+"')";
	}
	zgcljlh=request.getParameter("zgcljlh");
	if (zgcljlh!=null)
	{
		zgcljlh=cf.GB2Uni(zgcljlh);
		if (!(zgcljlh.equals("")))	wheresql+=" and  (crm_heysjl.zgcljlh='"+zgcljlh+"')";
	}
	jhjjsj=request.getParameter("jhjjsj");
	if (jhjjsj!=null)
	{
		jhjjsj=jhjjsj.trim();
		if (!(jhjjsj.equals("")))	wheresql+="  and (crm_heysjl.jhjjsj>=TO_DATE('"+jhjjsj+"','YYYY/MM/DD'))";
	}
	jhjjsj=request.getParameter("jhjjsj2");
	if (jhjjsj!=null)
	{
		jhjjsj=jhjjsj.trim();
		if (!(jhjjsj.equals("")))	wheresql+="  and (crm_heysjl.jhjjsj<=TO_DATE('"+jhjjsj+"','YYYY/MM/DD'))";
	}
	jsr=request.getParameter("jsr");
	if (jsr!=null)
	{
		jsr=cf.GB2Uni(jsr);
		if (!(jsr.equals("")))	wheresql+=" and  (crm_heysjl.jsr='"+jsr+"')";
	}
	jssj=request.getParameter("jssj");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (crm_heysjl.jssj>=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	jssj=request.getParameter("jssj2");
	if (jssj!=null)
	{
		jssj=jssj.trim();
		if (!(jssj.equals("")))	wheresql+="  and (crm_heysjl.jssj<=TO_DATE('"+jssj+"','YYYY/MM/DD'))";
	}
	cljg=request.getParameter("cljg");
	if (cljg!=null)
	{
		cljg=cf.GB2Uni(cljg);
		if (!(cljg.equals("")))	wheresql+=" and  (crm_heysjl.cljg='"+cljg+"')";
	}
	jjr=request.getParameter("jjr");
	if (jjr!=null)
	{
		jjr=cf.GB2Uni(jjr);
		if (!(jjr.equals("")))	wheresql+=" and  (crm_heysjl.jjr='"+jjr+"')";
	}
	jjsj=request.getParameter("jjsj");
	if (jjsj!=null)
	{
		jjsj=jjsj.trim();
		if (!(jjsj.equals("")))	wheresql+="  and (crm_heysjl.jjsj>=TO_DATE('"+jjsj+"','YYYY/MM/DD'))";
	}
	jjsj=request.getParameter("jjsj2");
	if (jjsj!=null)
	{
		jjsj=jjsj.trim();
		if (!(jjsj.equals("")))	wheresql+="  and (crm_heysjl.jjsj<=TO_DATE('"+jjsj+"','YYYY/MM/DD'))";
	}
	zgysjg=request.getParameter("zgysjg");
	if (zgysjg!=null)
	{
		zgysjg=cf.GB2Uni(zgysjg);
		if (!(zgysjg.equals("")))	wheresql+=" and  (crm_heysjl.zgysjg='"+zgysjg+"')";
	}
	zgysr=request.getParameter("zgysr");
	if (zgysr!=null)
	{
		zgysr=cf.GB2Uni(zgysr);
		if (!(zgysr.equals("")))	wheresql+=" and  (crm_heysjl.zgysr='"+zgysr+"')";
	}
	zgyssj=request.getParameter("zgyssj");
	if (zgyssj!=null)
	{
		zgyssj=zgyssj.trim();
		if (!(zgyssj.equals("")))	wheresql+="  and (crm_heysjl.zgyssj>=TO_DATE('"+zgyssj+"','YYYY/MM/DD'))";
	}
	zgyssj=request.getParameter("zgyssj2");
	if (zgyssj!=null)
	{
		zgyssj=zgyssj.trim();
		if (!(zgyssj.equals("")))	wheresql+="  and (crm_heysjl.zgyssj<=TO_DATE('"+zgyssj+"','YYYY/MM/DD'))";
	}
	sfszhf=request.getParameter("sfszhf");
	if (sfszhf!=null)
	{
		sfszhf=cf.GB2Uni(sfszhf);
		if (!(sfszhf.equals("")))	wheresql+=" and  (crm_heysjl.sfszhf='"+sfszhf+"')";
	}
	lrr=request.getParameter("lrr");
	if (lrr!=null)
	{
		lrr=cf.GB2Uni(lrr);
		if (!(lrr.equals("")))	wheresql+=" and  (crm_heysjl.lrr='"+lrr+"')";
	}

	lrsj=request.getParameter("lrsj");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_heysjl.lrsj>=TO_DATE('"+lrsj+"','YYYY/MM/DD'))";
	}
	lrsj=request.getParameter("lrsj2");
	if (lrsj!=null)
	{
		lrsj=lrsj.trim();
		if (!(lrsj.equals("")))	wheresql+="  and (crm_heysjl.lrsj<=TO_DATE('"+lrsj+" 23:59:59','YYYY-MM-DD hh24:mi:ss'))";
	}

	fdxbz=request.getParameter("fdxbz");
	if (fdxbz!=null)
	{
		fdxbz=cf.GB2Uni(fdxbz);
		if (!(fdxbz.equals("")))	wheresql+=" and  (crm_heysjl.fdxbz='"+fdxbz+"')";
	}
	padlrbz=request.getParameter("padlrbz");
	if (padlrbz!=null)
	{
		padlrbz=cf.GB2Uni(padlrbz);
		if (!(padlrbz.equals("")))	wheresql+=" and  (crm_heysjl.padlrbz='"+padlrbz+"')";
	}

	
	String xsfg=request.getParameter("xsfg");
	if (xsfg.equals("2"))
	{
		pageObj.setType("EXCEL",response);
	}

	String myxssl=null;
	myxssl=request.getParameter("myxssl");
	
	
	ls_sql="SELECT crm_heysjl.ysjlh, DECODE(crm_heysjl.sjysjg,'0','�ϸ�','1','������'), DECODE(crm_heysjl.clbz,'9','¼��δ���','0','û����','1','����δ����','2','����','3','�ڴ���','4','�ѽ��','5','����ͨ��','6','����δͨ��'),crm_heysjl.zpsl,crm_heysjl.khkkzpsl,crm_khxx.khxm,crm_khxx.fwdz,crm_heysjl.sjs,sgdmc,crm_heysjl.zjxm,crm_heysjl.gcysxmmc,crm_heysjl.yssj,crm_heysjl.ysr,crm_heysjl.zgcljlh,crm_heysjl.jhjjsj,crm_heysjl.jsr,crm_heysjl.jssj,crm_heysjl.jssm, DECODE(crm_heysjl.cljg,'3','�ڴ���','4','�ѽ��'),crm_heysjl.jjr,crm_heysjl.jjsj,crm_heysjl.jjsm, DECODE(crm_heysjl.zgysjg,'5','�ϸ�','6','���ϸ�'),crm_heysjl.zgysr,crm_heysjl.zgyssj,crm_heysjl.zgyssm,crm_heysjl.dwjg,crm_heysjl.dwwz,crm_heysjl.dwjd,crm_heysjl.dwwd,crm_heysjl.dwhb, DECODE(crm_heysjl.padlrbz,'0','����','1','�ͻ���')  , DECODE(crm_heysjl.fdxbz,'1','δ����','2','����'), DECODE(crm_heysjl.xlrmx,'1','����¼��','2','��¼��','3','��¼��'),crm_heysjl.khbh,crm_heysjl.yscsjlh,dwmc,crm_heysjl.lrr,crm_heysjl.lrsj,crm_heysjl.bz";
	ls_sql+=" FROM crm_heysjl,crm_khxx,sq_dwxx,sq_sgd  ";
    ls_sql+=" where crm_heysjl.khbh=crm_khxx.khbh(+)";
    ls_sql+=" and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.dwbh=sq_dwxx.dwbh(+)";
    ls_sql+=" and crm_heysjl.clbz in('1','6')";//9��¼��δ��ɣ�0��û���⣻1: ����δ���գ�2�����գ�3���ڴ���4���ѽ����5������ͨ����6������δͨ��
	if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
	{
		ls_sql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	}
	else
	{
		ls_sql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	}
    ls_sql+=wheresql;
    ls_sql+=" order by crm_heysjl.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Crm_heysjlJsList.jsp","","","JsCrm_heysjl.jsp");
	pageObj.setPageRow(Integer.parseInt(myxssl));
/*
//������ʾ��
	String[] disColName={"ysjlh","yscsjlh","khbh","crm_khxx_khxm","crm_khxx_fwdz","sjs","sgd","zjxm","gcysbbh","gcysxmbm","gcysxmmc","yssj","ysr","sjysjg","clbz","zgcljlh","jhjjsj","jsr","jssj","jssm","cljg","jjr","jjsj","jjsm","zgysjg","zgysr","zgyssj","zgyssm","sfszhf","hfszjlh","gcjdbm","zpsl","khkkzpsl","lrbm","lrr","lrsj","fdxbz","xlrmx","bz","dwjg","dwwz","dwjd","dwwd","dwhb","padlrbz"};
	pageObj.setDisColName(disColName);
*/

//��������
	String[] keyName={"ysjlh"};
	pageObj.setKey(keyName);
	pageObj.setEditStr("����");


//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"ysjlh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/gcgl/hrgcys/ysjl/ViewCrm_heysjl.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ysjlh",coluParm);//�в����������Hash��
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
  <B><font size="3">�������ռ�¼�����Ľ���</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(450);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="50px">&nbsp;</td>
	<td  width="70px">���ռ�¼��</td>
	<td  width="60px">��Ŀ���ս��</td>
	<td  width="2%">���Ĵ���״̬</td>
	<td  width="1%">��Ƭ����</td>
	<td  width="1%">�ͻ��ɿ�</td>
	<td  width="2%">�ͻ�����</td>
	<td  width="5%">���ݵ�ַ</td>
	<td  width="60px">���ʦ</td>
	<td  width="2%">ʩ����</td>
	<td  width="60px">����</td>
	<td  width="3%">������Ŀ</td>
	<td  width="90px">��Ŀ����ʱ��</td>
	<td  width="60px">��Ŀ������</td>
	<td  width="2%">���Ĵ����¼��</td>
	<td  width="90px">�ƻ����ʱ��</td>
	<td  width="60px">���Ľ�����</td>
	<td  width="2%">���Ľ���ʱ��</td>
	<td  width="6%">���Ľ���˵��</td>
	<td  width="2%">������</td>
	<td  width="60px">���Ĵ�����</td>
	<td  width="90px">���Ĵ���ʱ��</td>
	<td  width="10%">���Ĵ������</td>
	<td  width="2%">�������ս��</td>
	<td  width="60px">����������</td>
	<td  width="90px">��������ʱ��</td>
	<td  width="10%">�����������</td>

	<td  width="2%">��λ���</td>
	<td  width="2%">��λλ��</td>
	<td  width="70px">��λ����</td>
	<td  width="70px">��λγ��</td>
	<td  width="70px">��λ����</td>
	<td  width="70px">�ͻ���¼���־</td>
	<td  width="70px">�����ű�־</td>
	<td  width="70px">��¼����ϸ</td>
	<td  width="60px">�ͻ����</td>
	<td  width="70px">���մ�����¼��</td>
	<td  width="3%">ǩ������</td>
	<td  width="60px">¼����</td>
	<td  width="90px">¼��ʱ��</td>
	<td  width="5%">��ע</td>
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